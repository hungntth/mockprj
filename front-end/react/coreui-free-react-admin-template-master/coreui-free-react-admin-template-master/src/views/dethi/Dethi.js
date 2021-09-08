import React, { lazy } from 'react'
import { dethis } from 'src/data/mock-data'
const Listdethi = lazy(() => import('./Listdethi.js'))
const Dethi = () => {
        return(
            <>
            <table className="table table-hover table-outline mb-0 d-none d-sm-table">
                <thead className="thead-light">
                  <tr>
                    <th className="text-center">STT</th>
                    <th className="text-center">Category</th>
                    <th className="text-center">Mã đề</th>
                    <th className="text-center">Creator</th>
                    <th className="text-center">Create Date</th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  {dethis.map((item)=>{
                    return <Listdethi dethi={item}/>
                  })}
                </tbody>
              </table>
            </>
        )
}

export default Dethi