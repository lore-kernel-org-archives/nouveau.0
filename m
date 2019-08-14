From: Christoph Hellwig <hch@lst.de>
Subject: turn hmm migrate_vma upside down v3
Date: Wed, 14 Aug 2019 09:59:18 +0200
Message-ID: <20190814075928.23766-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi Jérôme, Ben and Jason,

below is a series against the hmm tree which starts revamping the
migrate_vma functionality.  The prime idea is to export three slightly
lower level functions and thus avoid the need for migrate_vma_ops
callbacks.

Diffstat:

    7 files changed, 282 insertions(+), 614 deletions(-)

A git tree is also available at:

    git://git.infradead.org/users/hch/misc.git migrate_vma-cleanup.3

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/migrate_vma-cleanup.3


Changes since v2:
 - don't unmap pages when returning 0 from nouveau_dmem_migrate_to_ram
 - minor style fixes
 - add a new patch to remove CONFIG_MIGRATE_VMA_HELPER

Changes since v1:
 - fix a few whitespace issues
 - drop the patch to remove MIGRATE_PFN_WRITE for now
 - various spelling fixes
 - clear cpages and npages in migrate_vma_setup
 - fix the nouveau_dmem_fault_copy_one return value
 - minor improvements to some nouveau internal calling conventions
