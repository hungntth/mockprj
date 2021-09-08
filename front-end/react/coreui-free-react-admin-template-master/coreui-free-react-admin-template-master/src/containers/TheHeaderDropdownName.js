import React from 'react'
import {
  CBadge,
  CDropdown,
  CDropdownItem,
  CDropdownMenu,
  CDropdownToggle,
  CProgress
} from '@coreui/react'
import CIcon from '@coreui/icons-react'

const TheHeaderDropdownName = () => {
  return (
    <CDropdown
      inNav
      className="c-header-nav-item mx-2 mt-3"
    >
      <p><b>Nguyễn Thái Hưng</b></p>
    </CDropdown>
  )
}

export default TheHeaderDropdownName