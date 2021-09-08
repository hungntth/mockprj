import React from 'react'

class Listungvien extends React.Component {
    render(){
        const ungvien =this.props.ungvien;

        return (
            <tr>
                        <td className="text-center">
                        <div><b>{ungvien.id}</b></div>
                        </td>
                        <td>
                          <div className="text-center">{ungvien.name}</div>
                        </td>
                        <td>
                          <div className="text-center">{ungvien.email}</div>
                        </td>
                        <td>
                          <div className="text-center">{ungvien.sdt}</div>
                        </td>
                        <td>
                          <div className="text-center">{ungvien.creator}</div>
                        </td>
                        <td>
                          <div className="text-center">{ungvien.createdate}</div>
                        </td>
                        <td>
                          <div className="text-center">{ungvien.action}</div>
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
export default Listungvien