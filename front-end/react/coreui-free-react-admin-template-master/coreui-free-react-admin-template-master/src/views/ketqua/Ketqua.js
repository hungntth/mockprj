import React, { lazy } from 'react'
import {ketquas} from "../../data/mock-data";

const Listketqua = lazy(() => import('./Listketqua.js'))

const Ungvien = () => {
  return (
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
                  {ketquas.map((item)=>{
                    return <Listketqua ketqua = {item} />
                  })}
                  
                </tbody>
              </table>

            
    </>
  )
}

export default Ungvien
