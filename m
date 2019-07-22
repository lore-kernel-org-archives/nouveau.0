From: Christoph Hellwig <hch@lst.de>
Subject: hmm_range_fault related fixes and legacy API removal v2
Date: Mon, 22 Jul 2019 11:44:20 +0200
Message-ID: <20190722094426.18563-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi Jérôme, Ben and Jason,

below is a series against the hmm tree which fixes up the mmap_sem
locking in nouveau and while at it also removes leftover legacy HMM APIs
only used by nouveau.

The first 4 patches are a bug fix for nouveau, which I suspect should
go into this merge window even if the code is marked as staging, just
to avoid people copying the breakage.

Changes since v1:
 - don't return the valid state from hmm_range_unregister
 - additional nouveau cleanups
