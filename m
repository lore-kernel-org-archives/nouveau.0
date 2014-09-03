From: Soham Chakraborty <sohamwonderpiku4u-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Traceback related to nouveau, possibly
Date: Wed, 3 Sep 2014 16:46:15 +0530
Message-ID: <CAHbM+PPvMPJSq2MCLdQLvbokKiZpK6v+DFH6mL_nGURkbYG1Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=20cf30050cd443b5bb0502275d87
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--20cf30050cd443b5bb0502275d87
Content-Type: multipart/alternative; boundary=20cf30050cd443b5b50502275d85

--20cf30050cd443b5b50502275d85
Content-Type: text/plain; charset=UTF-8

Hi fellas,

I come to you to clarify/corroborate one suspicion of mine, involving
nouveau. Few days since, my laptop started to create lots of kerneloops and
the traceback always involves nouveau. I didn't intend to create a bug
report without confirming that whether or not it really is a nouveau
problem.

Here is the backtrace in all its glory, attached.

Kernel - 3.14.6-200.fc20.x86_64
Three modules are tainted and therefore it refuses to be reported to
bugzilla. They are vboxnetadp,vboxnetflt,vboxdrv.

This is the relevant part that makes me wonder about whether this involves
the driver or rather, hardware. If it is hardware, then which part should I
focus?

Call Trace:
 [<ffffffffa02d6e7b>] ? nv04_timer_read+0x3b/0x70 [nouveau]
 [<ffffffffa02d6c34>] nouveau_timer_wait_eq+0x74/0xd0 [nouveau]
 [<ffffffffa02edd57>] nvc0_fifo_context_detach+0xa7/0x180 [nouveau]
 [<ffffffffa029473d>] nouveau_engctx_fini+0x6d/0xf0 [nouveau]
 [<ffffffffa0294862>] _nouveau_engctx_fini+0x12/0x20 [nouveau]
 [<ffffffffa0296e26>] nouveau_object_dec+0x106/0x290 [nouveau]
 [<ffffffffa0296e84>] nouveau_object_dec+0x164/0x290 [nouveau]
 [<ffffffffa029582a>] nouveau_handle_fini+0x1fa/0x2a0 [nouveau]
 [<ffffffffa02956ec>] nouveau_handle_fini+0xbc/0x2a0 [nouveau]
 [<ffffffffa02956ec>] nouveau_handle_fini+0xbc/0x2a0 [nouveau]
 [<ffffffffa02956ec>] nouveau_handle_fini+0xbc/0x2a0 [nouveau]
 [<ffffffffa02941e2>] nouveau_client_fini+0x62/0xb0 [nouveau]
 [<ffffffffa0314548>] nouveau_do_suspend+0x238/0x2b0 [nouveau]
 [<ffffffffa0314b5c>] nouveau_pmops_runtime_suspend+0x5c/0xe0 [nouveau]
 [<ffffffff81395451>] pci_pm_runtime_suspend+0x61/0x140
 [<ffffffff81470f11>] __rpm_callback+0x31/0x80
 [<ffffffff81470f84>] rpm_callback+0x24/0x80
 [<ffffffff81471116>] rpm_suspend+0x136/0x6d0
 [<ffffffff8147279a>] pm_runtime_work+0x7a/0xb0
 [<ffffffff810a68b6>] process_one_work+0x176/0x430
 [<ffffffff810a754b>] worker_thread+0x11b/0x3a0
 [<ffffffff810a7430>] ? rescuer_thread+0x3b0/0x3b0
 [<ffffffff810ae2a1>] kthread+0xe1/0x100
 [<ffffffff810ae1c0>] ? insert_kthread_work+0x40/0x40
 [<ffffffff8170057c>] ret_from_fork+0x7c/0xb0
 [<ffffffff810ae1c0>] ? insert_kthread_work+0x40/0x40

Any questions? Feel free to ask.

Thanks,
Soham

--20cf30050cd443b5b50502275d85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi fellas,<div><br></div><div>I come to you to clarify/cor=
roborate one suspicion of mine, involving nouveau. Few days since, my lapto=
p started to create lots of kerneloops and the traceback always involves no=
uveau. I didn&#39;t intend to create a bug report without confirming that w=
hether or not it really is a nouveau problem.=C2=A0</div>
<div><br></div><div>Here is the backtrace in all its glory, attached.=C2=A0=
</div><div><br></div><div>Kernel -=C2=A03.14.6-200.fc20.x86_64</div><div>Th=
ree modules are tainted and therefore it refuses to be reported to bugzilla=
. They are=C2=A0vboxnetadp,vboxnetflt,vboxdrv.</div>
<div><br></div><div>This is the relevant part that makes me wonder about wh=
ether this involves the driver or rather, hardware. If it is hardware, then=
 which part should I focus?</div><div><br></div><div><div>Call Trace:</div>
<div>=C2=A0[&lt;ffffffffa02d6e7b&gt;] ? nv04_timer_read+0x3b/0x70 [nouveau]=
</div><div>=C2=A0[&lt;ffffffffa02d6c34&gt;] nouveau_timer_wait_eq+0x74/0xd0=
 [nouveau]</div><div>=C2=A0[&lt;ffffffffa02edd57&gt;] nvc0_fifo_context_det=
ach+0xa7/0x180 [nouveau]</div>
<div>=C2=A0[&lt;ffffffffa029473d&gt;] nouveau_engctx_fini+0x6d/0xf0 [nouvea=
u]</div><div>=C2=A0[&lt;ffffffffa0294862&gt;] _nouveau_engctx_fini+0x12/0x2=
0 [nouveau]</div><div>=C2=A0[&lt;ffffffffa0296e26&gt;] nouveau_object_dec+0=
x106/0x290 [nouveau]</div>
<div>=C2=A0[&lt;ffffffffa0296e84&gt;] nouveau_object_dec+0x164/0x290 [nouve=
au]</div><div>=C2=A0[&lt;ffffffffa029582a&gt;] nouveau_handle_fini+0x1fa/0x=
2a0 [nouveau]</div><div>=C2=A0[&lt;ffffffffa02956ec&gt;] nouveau_handle_fin=
i+0xbc/0x2a0 [nouveau]</div>
<div>=C2=A0[&lt;ffffffffa02956ec&gt;] nouveau_handle_fini+0xbc/0x2a0 [nouve=
au]</div><div>=C2=A0[&lt;ffffffffa02956ec&gt;] nouveau_handle_fini+0xbc/0x2=
a0 [nouveau]</div><div>=C2=A0[&lt;ffffffffa02941e2&gt;] nouveau_client_fini=
+0x62/0xb0 [nouveau]</div>
<div>=C2=A0[&lt;ffffffffa0314548&gt;] nouveau_do_suspend+0x238/0x2b0 [nouve=
au]</div><div>=C2=A0[&lt;ffffffffa0314b5c&gt;] nouveau_pmops_runtime_suspen=
d+0x5c/0xe0 [nouveau]</div><div>=C2=A0[&lt;ffffffff81395451&gt;] pci_pm_run=
time_suspend+0x61/0x140</div>
<div>=C2=A0[&lt;ffffffff81470f11&gt;] __rpm_callback+0x31/0x80</div><div>=
=C2=A0[&lt;ffffffff81470f84&gt;] rpm_callback+0x24/0x80</div><div>=C2=A0[&l=
t;ffffffff81471116&gt;] rpm_suspend+0x136/0x6d0</div><div>=C2=A0[&lt;ffffff=
ff8147279a&gt;] pm_runtime_work+0x7a/0xb0</div>
<div>=C2=A0[&lt;ffffffff810a68b6&gt;] process_one_work+0x176/0x430</div><di=
v>=C2=A0[&lt;ffffffff810a754b&gt;] worker_thread+0x11b/0x3a0</div><div>=C2=
=A0[&lt;ffffffff810a7430&gt;] ? rescuer_thread+0x3b0/0x3b0</div><div>=C2=A0=
[&lt;ffffffff810ae2a1&gt;] kthread+0xe1/0x100</div>
<div>=C2=A0[&lt;ffffffff810ae1c0&gt;] ? insert_kthread_work+0x40/0x40</div>=
<div>=C2=A0[&lt;ffffffff8170057c&gt;] ret_from_fork+0x7c/0xb0</div><div>=C2=
=A0[&lt;ffffffff810ae1c0&gt;] ? insert_kthread_work+0x40/0x40</div></div><d=
iv><br></div>
<div>Any questions? Feel free to ask.</div><div><br></div><div>Thanks,</div=
><div>Soham</div></div>

--20cf30050cd443b5b50502275d85--

--20cf30050cd443b5bb0502275d87
Content-Type: application/octet-stream; name=backtrace
Content-Disposition: attachment; filename=backtrace
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hzmkdwcv0

QlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMxIHN0dWNrIGZvciAyMnMhIFtrd29ya2VyLzE6MTo2MV0K
TW9kdWxlcyBsaW5rZWQgaW46IHBwcF9hc3luYyBjcmNfY2NpdHQgcHBwX2dlbmVyaWMgc2xoYyBu
bHNfdXRmOCBpc29mcyBmdXNlIGlwdF9NQVNRVUVSQURFIHh0X0NIRUNLU1VNIHR1biBpcDZ0X3Jw
ZmlsdGVyIGlwNnRfUkVKRUNUIHh0X2Nvbm50cmFjayBlYnRhYmxlX25hdCBlYnRhYmxlX2Jyb3V0
ZSBicmlkZ2Ugc3RwIGxsYyBlYnRhYmxlX2ZpbHRlciBlYnRhYmxlcyBpcDZ0YWJsZV9uYXQgbmZf
Y29ubnRyYWNrX2lwdjYgbmZfZGVmcmFnX2lwdjYgbmZfbmF0X2lwdjYgaXA2dGFibGVfbWFuZ2xl
IGlwNnRhYmxlX3NlY3VyaXR5IGlwNnRhYmxlX3JhdyBpcDZ0YWJsZV9maWx0ZXIgaXA2X3RhYmxl
cyBpcHRhYmxlX25hdCBuZl9jb25udHJhY2tfaXB2NCBuZl9kZWZyYWdfaXB2NCBuZl9uYXRfaXB2
NCBuZl9uYXQgbmZfY29ubnRyYWNrIGlwdGFibGVfbWFuZ2xlIGlwdGFibGVfc2VjdXJpdHkgaXB0
YWJsZV9yYXcgYm5lcCBvcHRpb24gdXNiX3d3YW4gc25kX2hkYV9jb2RlY19pZHQgc25kX2hkYV9j
b2RlY19nZW5lcmljIHNuZF9oZGFfaW50ZWwgc25kX2hkYV9jb2RlYyBzbmRfaHdkZXAgc25kX3Nl
cSBzbmRfc2VxX2RldmljZSBzbmRfcGNtIGFyYzQgYnJjbXNtYWMgYnR1c2IgY29yZGljIGJyY211
dGlsIGJsdWV0b290aCBiNDMgbWFjODAyMTEgY2ZnODAyMTEgaVRDT193ZHQgaVRDT192ZW5kb3Jf
c3VwcG9ydCBtZWlfbWUgbWVpIGxwY19pY2ggc3NiIDZsb3dwYW5faXBoYyBkZWxsX3dtaSBwcGRl
diBzcGFyc2Vfa2V5bWFwIHV2Y3ZpZGVvIHZpZGVvYnVmMl92bWFsbG9jIHZpZGVvYnVmMl9tZW1v
cHMgeDg2X3BrZ190ZW1wX3RoZXJtYWwgdmlkZW9idWYyX2NvcmUgY29yZXRlbXAga3ZtX2ludGVs
IGt2bSBkZWxsX2xhcHRvcCBkY2RiYXMgc2RoY2lfcGNpIHNkaGNpIG1tY19jb3JlIGJjbWEgc2hw
Y2hwIHJma2lsbCBzbmRfdGltZXIgc25kIGkyY19pODAxIHZpZGVvZGV2IG1lZGlhIGNyY3QxMGRp
Zl9wY2xtdWwgY3JjMzJfcGNsbXVsIGNyYzMyY19pbnRlbCBnaGFzaF9jbG11bG5pX2ludGVsIG1m
ZF9jb3JlIHNlcmlvX3JhdyBzb3VuZGNvcmUgbWljcm9jb2RlIHBhcnBvcnRfcGMgcGFycG9ydCBi
aW5mbXRfbWlzYyBub3V2ZWF1IHVzYl9zdG9yYWdlIGk5MTUgbXhtX3dtaSB0dG0gaTJjX2FsZ29f
Yml0IGUxMDAwZSBkcm1fa21zX2hlbHBlciBkcm0gcHRwIHBwc19jb3JlIGkyY19jb3JlIHdtaSB2
aWRlbyBlY3J5cHRmcyBlbmNyeXB0ZWRfa2V5cyB0cnVzdGVkIHRwbSB2Ym94bmV0YWRwKE9GKSB2
Ym94bmV0Zmx0KE9GKSB2Ym94ZHJ2KE9GKQpDUFU6IDEgUElEOiA2MSBDb21tOiBrd29ya2VyLzE6
MSBUYWludGVkOiBHRiAgICAgICBXICBPIDMuMTQuNi0yMDAuZmMyMC54ODZfNjQgIzEKSGFyZHdh
cmUgbmFtZTogRGVsbCBJbmMuIExhdGl0dWRlIEU2NTMwLzA3WTg1TSwgQklPUyBBMDkgMTIvMTMv
MjAxMgpXb3JrcXVldWU6IHBtIHBtX3J1bnRpbWVfd29yawp0YXNrOiBmZmZmODgwMjIyNzgxMzAw
IHRpOiBmZmZmODgwMjIyN2RlMDAwIHRhc2sudGk6IGZmZmY4ODAyMjI3ZGUwMDAKUklQOiAwMDEw
Ols8ZmZmZmZmZmY4MTM2OWNkMj5dICBbPGZmZmZmZmZmODEzNjljZDI+XSBpb3JlYWQzMisweDQy
LzB4NTAKUlNQOiAwMDE4OmZmZmY4ODAyMjI3ZGY5ZDggIEVGTEFHUzogMDAwMDAyOTYKUkFYOiAw
MDAwMDAwMGZmZmZmZmZmIFJCWDogZmYwMDVkMzAzMDMwNjUzNyBSQ1g6IDAwMDAwMDAwZmZmZmZm
ZmYKUkRYOiBmZmZmODgwMjIwNjhlNDAwIFJTSTogMDAwMDAwMDA3NzM1OTQwMCBSREk6IGZmZmZj
OTAwMDUxMDk0MTAKUkJQOiBmZmZmODgwMjIyN2RmOWY4IFIwODogMDAwMDAwMDAwMDAwMDAwMSBS
MDk6IDAwMDAwMDAwMDAwMDAwMDAKUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAw
MDAwMDAwZiBSMTI6IDY2NjY2NjViNWQzNjMxMzEKUjEzOiA2MzMwMzAzMzMwNzgzMDViIFIxNDog
ZmZmZjg4MDIyMjdkZjk2MCBSMTU6IGZmZmZmZmZmYTAyOTdiNjYKRlM6ICAwMDAwMDAwMDAwMDAw
MDAwKDAwMDApIEdTOmZmZmY4ODAyMmUyNDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAw
MApDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCkNSMjog
MDAwMDdmNGM0MmE2MTAwMCBDUjM6IDAwMDAwMDAwMDFjMGMwMDAgQ1I0OiAwMDAwMDAwMDAwMTQw
N2UwClN0YWNrOgogZmZmZmZmZmZhMDJkNmU2OCBmZmZmODgwMjIwMDY5YTAwIGZmZmY4ODAwMzY4
ZjljMDAgMDAwMDAwMDAwMDAwMjYzNAogZmZmZjg4MDIyMjdkZmE0MCBmZmZmZmZmZmEwMmQ2YzM0
IDAwMDAwMDAwNzczNTk0MDAgZmZmZmZmZmZmZmZmZmZmZgogZmZmZjg4MDIyMDBjZDZjMCBmZmZm
ODgwMjIwMDY5YTAwIGZmZmY4ODAwMzZiMjhjMDAgZmZmZjg4MDAzNjQwZmI4MApDYWxsIFRyYWNl
OgogWzxmZmZmZmZmZmEwMmQ2ZTY4Pl0gPyBudjA0X3RpbWVyX3JlYWQrMHgyOC8weDcwIFtub3V2
ZWF1XQogWzxmZmZmZmZmZmEwMmQ2YzM0Pl0gbm91dmVhdV90aW1lcl93YWl0X2VxKzB4NzQvMHhk
MCBbbm91dmVhdV0KIFs8ZmZmZmZmZmZhMDJlZGQ1Nz5dIG52YzBfZmlmb19jb250ZXh0X2RldGFj
aCsweGE3LzB4MTgwIFtub3V2ZWF1XQogWzxmZmZmZmZmZmEwMjk0NzNkPl0gbm91dmVhdV9lbmdj
dHhfZmluaSsweDZkLzB4ZjAgW25vdXZlYXVdCiBbPGZmZmZmZmZmYTAyOTQ4NjI+XSBfbm91dmVh
dV9lbmdjdHhfZmluaSsweDEyLzB4MjAgW25vdXZlYXVdCiBbPGZmZmZmZmZmYTAyOTZlMjY+XSBu
b3V2ZWF1X29iamVjdF9kZWMrMHgxMDYvMHgyOTAgW25vdXZlYXVdCiBbPGZmZmZmZmZmYTAyOTZl
ODQ+XSBub3V2ZWF1X29iamVjdF9kZWMrMHgxNjQvMHgyOTAgW25vdXZlYXVdCiBbPGZmZmZmZmZm
YTAyOTU4MmE+XSBub3V2ZWF1X2hhbmRsZV9maW5pKzB4MWZhLzB4MmEwIFtub3V2ZWF1XQogWzxm
ZmZmZmZmZmEwMjk1NmVjPl0gbm91dmVhdV9oYW5kbGVfZmluaSsweGJjLzB4MmEwIFtub3V2ZWF1
XQogWzxmZmZmZmZmZmEwMjk1NmVjPl0gbm91dmVhdV9oYW5kbGVfZmluaSsweGJjLzB4MmEwIFtu
b3V2ZWF1XQogWzxmZmZmZmZmZmEwMjk1NmVjPl0gbm91dmVhdV9oYW5kbGVfZmluaSsweGJjLzB4
MmEwIFtub3V2ZWF1XQogWzxmZmZmZmZmZmEwMjk0MWUyPl0gbm91dmVhdV9jbGllbnRfZmluaSsw
eDYyLzB4YjAgW25vdXZlYXVdCiBbPGZmZmZmZmZmYTAzMTQ1NDg+XSBub3V2ZWF1X2RvX3N1c3Bl
bmQrMHgyMzgvMHgyYjAgW25vdXZlYXVdCiBbPGZmZmZmZmZmYTAzMTRiNWM+XSBub3V2ZWF1X3Bt
b3BzX3J1bnRpbWVfc3VzcGVuZCsweDVjLzB4ZTAgW25vdXZlYXVdCiBbPGZmZmZmZmZmODEzOTU0
NTE+XSBwY2lfcG1fcnVudGltZV9zdXNwZW5kKzB4NjEvMHgxNDAKIFs8ZmZmZmZmZmY4MTQ3MGYx
MT5dIF9fcnBtX2NhbGxiYWNrKzB4MzEvMHg4MAogWzxmZmZmZmZmZjgxNDcwZjg0Pl0gcnBtX2Nh
bGxiYWNrKzB4MjQvMHg4MAogWzxmZmZmZmZmZjgxNDcxMTE2Pl0gcnBtX3N1c3BlbmQrMHgxMzYv
MHg2ZDAKIFs8ZmZmZmZmZmY4MTQ3Mjc5YT5dIHBtX3J1bnRpbWVfd29yaysweDdhLzB4YjAKIFs8
ZmZmZmZmZmY4MTBhNjhiNj5dIHByb2Nlc3Nfb25lX3dvcmsrMHgxNzYvMHg0MzAKIFs8ZmZmZmZm
ZmY4MTBhNzU0Yj5dIHdvcmtlcl90aHJlYWQrMHgxMWIvMHgzYTAKIFs8ZmZmZmZmZmY4MTBhNzQz
MD5dID8gcmVzY3Vlcl90aHJlYWQrMHgzYjAvMHgzYjAKIFs8ZmZmZmZmZmY4MTBhZTJhMT5dIGt0
aHJlYWQrMHhlMS8weDEwMAogWzxmZmZmZmZmZjgxMGFlMWMwPl0gPyBpbnNlcnRfa3RocmVhZF93
b3JrKzB4NDAvMHg0MAogWzxmZmZmZmZmZjgxNzAwNTdjPl0gcmV0X2Zyb21fZm9yaysweDdjLzB4
YjAKIFs8ZmZmZmZmZmY4MTBhZTFjMD5dID8gaW5zZXJ0X2t0aHJlYWRfd29yaysweDQwLzB4NDAK
Q29kZTogNjYgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgNTUgNDggYzcgYzYgMjUgZDYgYTQgODEg
NDggODkgZTUgZTggZjAgZmUgZmYgZmYgYjggZmYgZmYgZmYgZmYgNWQgYzMgNjYgMGYgMWYgODQg
MDAgMDAgMDAgMDAgMDAgOGIgMDcgPGMzPiA2NiA2NiA2NiA2NiAyZSAwZiAxZiA4NCAwMCAwMCAw
MCAwMCAwMCA0OCA4MSBmZSBmZiBmZiAwMyAwMCAK
--20cf30050cd443b5bb0502275d87
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--20cf30050cd443b5bb0502275d87--
