import React,{useEffect,useState} from 'react';
import { useFormik } from 'formik';
import CandidateApi from '../../api/CandidateApi';
import {
    Button,
    Card,
    CardBody,
    CardHeader,
    CardTitle,
    Form,
    FormGroup,
    Input,
    Label,
  } from "reactstrap";
  import { useHistory } from "react-router";

function UpdateCandidate ({match}, props) {
    
    const {id} = match.params;
    const [candidate, setCandidate] = useState({fullName:'',phoneNumber:''});
    
    const history = useHistory()

    const getUsers = async (id) =>{
        const candidateInfo = await CandidateApi.getByID(id)
        setCandidate(candidateInfo);
        console.log(candidateInfo.fullName)
      }
    
      useEffect(() => {
        getUsers(id)
        
       
      }, [])

    const formik = useFormik({
            initialValues: {
            fullName: '',
            phoneNumber:'',
        },
        
        validate: async values => {
            const errors = {};
            // firstname
            if (!values.fullName) {
                errors.fullName = 'Required';
            } else if (values.fullName.length < 5) {
                errors.fullName = 'Must be 5 characters or greater';
            }
            // email
            if (!values.phoneNumber) {
                errors.phoneNumber = 'Required';
            } else if (!/((09|03|07|08|05)+([0-9]{8})\b)/i.test(values.phoneNumber)) {
                errors.phoneNumber = 'Invalid email address';
            }

            return errors;
        },
        onSubmit: async (values) => {
            const body = {    
                fullName: values.fullName,
                phoneNumber: values.phoneNumber
            }
            try {
                await CandidateApi.updateCandidate(id,body);
                history.goBack();
                
               
            } catch (error) {
                console.log(error);
            }
        }
    });

    
           

    return (
        <>
            <Card>
                <CardHeader>
                    <CardTitle tag="h2" >Create Candidate</CardTitle>
                </CardHeader>
                <CardBody>
                    <Form onSubmit={formik.handleSubmit}>
                        <FormGroup>
                            <Label>Full Name</Label>
                            <Input
                                id="fullName"
                                name="fullName"
                                type="text"
                                {...formik.getFieldProps('phoneNumber')}
                                invalid = {formik.touched.fullName && formik.errors.fullName ?
                                    <div>{formik.errors.fullName}</div>
                                    :
                                    null}
                            />
                            {formik.touched.fullName && formik.errors.fullName ?
                                <div>{formik.errors.fullName}</div>
                                :
                                null
                            }
                        </FormGroup>
                        <FormGroup>
                            <Label>Phone Number</Label>
                            <Input
                                id="phoneNumber"
                                name="phoneNumber"
                                type="text"
                                {...formik.getFieldProps('phoneNumber')}
                                invalid = {formik.touched.phoneNumber && formik.errors.phoneNumber ?
                                    <div>{formik.errors.phoneNumber}</div>
                                    :
                                    null}
                            />
                            {formik.touched.phoneNumber && formik.errors.phoneNumber ?
                                <div>{formik.errors.phoneNumber}</div>
                                :
                                null
                            }
                        </FormGroup>
                        <Button color="primary" disabled={formik.isSubmitting}>Submit</Button>
                    </Form>
                </CardBody>
            </Card>
        </>
    )
}

    export default UpdateCandidate;

