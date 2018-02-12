From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/5] Fix deadlock on runtime suspend in DRM
 drivers
Date: Mon, 12 Feb 2018 04:39:47 +0100
Message-ID: <20180212033947.GA19049@wunner.de>
References: <cover.1518338788.git.lukas@wunner.de>
 <CAHbf0-Fhi9j5H7VTxF84SENQph+UQE2zRbi2Q-u_DAMh6x+eSg@mail.gmail.com>
 <20180211192314.GA22869@wunner.de>
 <20180211194154.GB22869@wunner.de>
 <CAHbf0-HSNJmXs_Nm+bbcfUifoLEpFsMSpM96a-pVfLFMNz3GFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAHbf0-HSNJmXs_Nm+bbcfUifoLEpFsMSpM96a-pVfLFMNz3GFw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Ismo Toijala <ismo.toijala@gmail.com>, Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Tejun Heo <tj@kernel.org>, Dave Airlie <airlied@redhat.com>, Peter Wu <peter@lekensteyn.nl>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBGZWIgMTIsIDIwMTggYXQgMTI6MzU6NTFBTSArMDAwMCwgTWlrZSBMb3RoaWFuIHdy
b3RlOgo+IEkndmUgbm90IGJlZW4gYWJsZSB0byByZXByb2R1Y2UgdGhlIG9yaWdpbmFsIHByb2Js
ZW0geW91J3JlIHRyeWluZyB0bwo+IHNvbHZlIG9uIGFtZGdwdSB0aGF0cyB3aXRoIG9yIHdpdGhv
dXQgeW91ciBwYXRjaCBzZXQgYW5kIHRoZSBhYm92ZQo+ICJ0cmlnZ2VyIiB0b28KPiAKPiBJcyBh
bnl0aGluZyBlbHNlIHJlcXVpcmVkIHRvIHRyaWdnZXIgaXQsIEkgc3RhcnRlZCBtdWx0aXBsZSBE
UklfUFJJTUUKPiBnbHhnZWFycywgaW4gcGFyYWxsZWwsIHNlcmlhbCB3YWl0aW5nIHRoZSAxMiBz
ZWNvbmRzIGFuZCBzZXJpYWwgd2l0aGluCj4gdGhlIDEyIHNlY29uZHMgYW5kIEkgY291bGRuJ3Qg
cmVwcm9kdWNlIGl0CgpUaGUgZGlzY3JldGUgR1BVIG5lZWRzIHRvIHJ1bnRpbWUgc3VzcGVuZCwg
dGhhdCdzIHRoZSB0cmlnZ2VyLApzbyBubyBEUklfUFJJTUUgZXhlY3V0YWJsZXMgc2hvdWxkIGJl
IHJ1bm5pbmcuICBKdXN0IGxldCBpdAphdXRvc3VzcGVuZCBhZnRlciBib290LiAgRG8geW91IHNl
ZSAid2FpdGluZyAxMiBzZWMiIG1lc3NhZ2VzCmluIGRtZXNnPyAgSWYgbm90IGl0J3Mgbm90IGF1
dG9zdXNwZW5kaW5nLgoKVGhhbmtzLAoKTHVrYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
