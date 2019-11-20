From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
Subject: Move io_reserve_lru handling into the driver
Date: Wed, 20 Nov 2019 14:17:49 +0100
Message-ID: <20191120131751.15904-1-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: imirkin@alum.mit.edu, skeggsb@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

SnVzdCBhIGdlbnRsZSBwaW5nIG9uIHRoaXMuCgpBbHJlYWR5IGdvdCB0aGUgQWNrZWQtYnkgZnJv
bSBEYW5pZWwsIGJ1dCBJIG5lZWQgc29tZSBvZiB0aGUKbm91dmVhdSBndXlzIHRvIHRlc3QgdGhp
cyBzaW5jZSBJIGNhbiBvbmx5IGNvbXBpbGUgdGVzdCBpdC4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
