import React from 'react'
import CIcon from '@coreui/icons-react'
import { freeSet } from '@coreui/icons'

class Listdethi extends React.Component {
    render(){
        const dethi =this.props.dethi;

        return (
            <tr>
                        <td className="text-center">
                        <div><b>{dethi.id}</b></div>
                        </td>
                        <td>
                          <div className="text-center">{dethi.category}</div>
                        </td>
                        <td>
                          <div className="text-center">{dethi.made}</div>
                        </td>
                        <td>
                          <div className="text-center">{dethi.creator}</div>
                        </td>
                        <td>
                          <div className="text-center">{dethi.createdate}</div>
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

export default Listdethi