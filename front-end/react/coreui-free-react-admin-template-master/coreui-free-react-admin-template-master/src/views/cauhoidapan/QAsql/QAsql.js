import React, { lazy } from 'react'
const QAsql = () => {
        return(
            <>
            <table className="table table-hover table-outline mb-0 d-none d-sm-table">
                <thead className="thead-light">
                  <tr>
                    <th className="text-center">STT</th>
                    <th className="text-center">Họ Và Tên</th>
                    <th className="text-center">SĐT</th>
                    <th className="text-center">Ngày Thi	</th>
                    <th className="text-center">SQL</th>
                    <th className="text-center">Java</th>
                    <th className="text-center">IQ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td className="text-center">
                    <div><b>1</b></div>
                    </td>
                    <td>
                      <div className="text-center">Yiorgos Avraamu</div>
                    </td>
                    <td>
                      <div className="text-center">0962.444.xxx</div>
                    </td>
                    <td>
                      <div className="text-center">Jun 11, 2015</div>
                    </td>
                    <td>
                      <div className="text-center">5</div>
                    </td>
                    <td>
                      <div className="text-center">6</div>
                    </td>
                    <td>
                      <div className="text-center">7</div>
                    </td>
                    
                  </tr>
                </tbody>
              </table>
            </>
        )
}

export default QAsql