From: Christoph Hellwig <hch@lst.de>
Subject: dev_pagemap related cleanups v2
Date: Mon, 17 Jun 2019 14:27:08 +0200
Message-ID: <20190617122733.22432-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi Dan, Jérôme and Jason,

below is a series that cleans up the dev_pagemap interface so that
it is more easily usable, which removes the need to wrap it in hmm
and thus allowing to kill a lot of code

Note: this series is on top of the rdma/hmm branch + the dev_pagemap
releas fix series from Dan that went into 5.2-rc5.

Git tree:

    git://git.infradead.org/users/hch/misc.git hmm-devmem-cleanup.2

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/hmm-devmem-cleanup.2

Changes since v1:
 - rebase
 - also switch p2pdma to the internal refcount
 - add type checking for pgmap->type
 - rename the migrate method to migrate_to_ram
 - cleanup the altmap_valid flag
 - various tidbits from the reviews
