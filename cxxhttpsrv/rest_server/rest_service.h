// This file is part of MicroRestD <http://github.com/ufal/microrestd/>.
//
// Copyright 2015 Institute of Formal and Applied Linguistics, Faculty of
// Mathematics and Physics, Charles University in Prague, Czech Republic.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

#pragma once

#include <unordered_map>

#include "rest_request.h"

namespace cxxhttpsrv {

class rest_service {
 public:
  // Regular request handle
  virtual bool handle(rest_request& req) = 0;

  // HTTP Range request, disabled by default
  virtual bool handle_partial(rest_request& req) { return false; }
};

} // namespace cxxhttpsrv
