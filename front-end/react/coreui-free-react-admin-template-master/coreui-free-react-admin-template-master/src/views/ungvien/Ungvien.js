import React, { lazy } from 'react'
import {ungviens} from "../../data/mock-data";

const Listungvien = lazy(() => import('./Listungvien.js'))
const WidgetsDropdown = lazy(() => import('../widgets/WidgetsDropdown.js'))
const WidgetsBrand = lazy(() => import('../widgets/WidgetsBrand.js'))

const Ungvien = () => {
  return (
    <>
              <table className="table table-hover table-outline mb-0 d-none d-sm-table">
                <thead className="thead-light">
                  <tr>
                    <th className="text-center">ID</th>
                    <th className="text-center">Họ Và Tên</th>
                    <th className="text-center">Email</th>
                    <th className="text-center">SĐT</th>
                    <th className="text-center">Creator</th>
                    <th className="text-center">Create Date</th>
                    <th className="text-center">Action</th>
                    <th className="text-center"> </th>
                    <th className="text-center"> </th>
                  </tr>
                </thead>
                <tbody>
                  {ungviens.map((item)=>{
                    return <Listungvien ungvien = {item}/>
                  })}
                  
                </tbody>
              </table>

            
    </>
  )
}

export default Ungvien
