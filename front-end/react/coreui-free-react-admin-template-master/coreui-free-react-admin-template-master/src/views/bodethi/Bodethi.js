import React, { lazy } from 'react'
import {bodethis} from "../../data/mock-data";
const Listbodethi = lazy(() => import('./Listbodethi.js'))
const Bodethi = () => {
        return(
            <>
            <table className="table table-hover table-outline mb-0 d-none d-sm-table">
                <thead className="thead-light">
                  <tr>
                    <th className="text-center">STT</th>
                    <th className="text-center">Mã Bộ Đề</th>
                    <th className="text-center">Mã Đề SQL</th>
                    <th className="text-center">Mã Đề JAVA</th>
                    <th className="text-center">Mã Đề IQ</th>
                    <th className="text-center">Creator</th>
                    <th className="text-center">Create Date</th>
                    <th className="text-center"></th>
                    <th className="text-center"></th>

                  </tr>
                </thead>
                <tbody>
                {bodethis.map((item)=>{
                    return <Listbodethi bodethi = {item} />
                  })}
                </tbody>
              </table>
            </>
        )
}

export default Bodethi