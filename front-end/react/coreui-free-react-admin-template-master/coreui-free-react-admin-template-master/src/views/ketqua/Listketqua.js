import React from 'react'

class Listketqua extends React.Component {
    render(){
        const ketqua =this.props.ketqua;

        return (
            <tr>
                        <td className="text-center">
                        <div><b>{ketqua.id}</b></div>
                        </td>
                        <td>
                          <div className="text-center">{ketqua.name}</div>
                        </td>
                        <td>
                          <div className="text-center">{ketqua.phone}</div>
                        </td>
                        <td>
                          <div className="text-center">{ketqua.date}</div>
                        </td>
                        <td>
                          <div className="text-center">{ketqua.sqlscores}</div>
                        </td>
                        <td>
                          <div className="text-center">{ketqua.javascores}</div>
                        </td>
                        <td>
                          <div className="text-center">{ketqua.iqscores}</div>
                        </td>
                        
                        
                      </tr>
        )
    }
}
// const Listungvien = () => {
//     return (
//         <tr>
//                     <td className="text-center">
//                     <div><b>1</b></div>
//                     </td>
//                     <td>
//                       <div className="text-center">Yiorgos Avraamu</div>
//                     </td>
//                     <td>
//                       <div className="text-center">0962.444.xxx</div>
//                     </td>
//                     <td>
//                       <div className="text-center">Jun 11, 2015</div>
//                     </td>
//                     <td>
//                       <div className="text-center">5</div>
//                     </td>
//                     <td>
//                       <div className="text-center">6</div>
//                     </td>
//                     <td>
//                       <div className="text-center">7</div>
//                     </td>
                    
//                   </tr>
//     )

// }

export default Listketqua