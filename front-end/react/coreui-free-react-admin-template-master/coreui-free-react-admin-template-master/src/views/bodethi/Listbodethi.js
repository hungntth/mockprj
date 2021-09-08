import React from 'react'
import CIcon from '@coreui/icons-react'
import { freeSet } from '@coreui/icons'

class Listbodethi extends React.Component {
    render(){
        const bodethi =this.props.bodethi;

        return (
            <tr>
                        <td className="text-center">
                        <div><b>{bodethi.id}</b></div>
                        </td>
                        <td>
                          <div className="text-center">{bodethi.name}</div>
                        </td>
                        <td>
                          <div className="text-center">{bodethi.sqlcode}</div>
                        </td>
                        <td>
                          <div className="text-center">{bodethi.javacode}</div>
                        </td>
                        <td>
                          <div className="text-center">{bodethi.iqcode}</div>
                        </td>
                        <td>
                          <div className="text-center">{bodethi.creator}</div>
                        </td>
                        <td>
                          <div className="text-center">{bodethi.createdate}</div>
                        </td>
                        <td>
                        <button className="btn btn-warning">Edit</button>
                        </td>
                        <td>
                        <button className="btn btn-danger">Delete</button>
                        </td>
                        
                      </tr>
        )
    }
}

export default Listbodethi