#Copyright 2023 KubeCube Authors
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

# alpine:3.6 has no arm64 variant and the old mirror is deprecated; use the
# multi-arch official image so the warden-init image builds for both amd64
# and arm64. The bundle only carries shell scripts and a tarball.
FROM alpine:3.18

COPY third-charts.tar.gz .

COPY install_hotplug.sh install_hotplug.sh

RUN chmod +x install_hotplug.sh

CMD ["/bin/sh","install_hotplug.sh"]

