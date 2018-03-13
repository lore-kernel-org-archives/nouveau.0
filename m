From: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 00/13] SVM (share virtual memory) with HMM
 in nouveau
Date: Tue, 13 Mar 2018 10:31:00 -0400
Message-ID: <20180313143100.GC3828@redhat.com>
References: <20180310032141.6096-1-jglisse@redhat.com>
 <cae53b72-f99c-7641-8cb9-5cbe0a29b585@gmail.com>
 <20180312173009.GN8589@phenom.ffwll.local>
 <20180312175057.GC4214@redhat.com>
 <39139ff7-76ad-960c-53f6-46b57525b733@nvidia.com>
 <20180313132940.GB3304@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180313132940.GB3304-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Bridgman,
 John" <John.Bridgman-5C7GfCeVMHo@public.gmane.org>, Felix Kuehling <felix.kuehling-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Evgeny Baskakov <ebaskakov-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDY6Mjk6NDBBTSAtMDcwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gTW9uLCBNYXIgMTIsIDIwMTggYXQgMTE6MTQ6NDdQTSAtMDcwMCwgSm9obiBI
dWJiYXJkIHdyb3RlOgo+ID4gWWVzLCBvbiBOVklESUEgR1BVcywgdGhlIEhvc3QvRklGTyB1bml0
IGlzIGxpbWl0ZWQgdG8gNDAtYml0IGFkZHJlc3Nlcywgc28KPiA+IHRoaW5ncyBzdWNoIGFzIHRo
ZSBmb2xsb3dpbmcgbmVlZCB0byBiZSBiZWxvdyAoMSA8PCA0MCksIGFuZCBhbHNvIGFjY2Vzc2li
bGUgCj4gPiB0byBib3RoIENQVSAodXNlciBzcGFjZSkgYW5kIEdQVSBoYXJkd2FyZS4gCj4gPiAg
ICAgLS0gY29tbWFuZCBidWZmZXJzIChDUFUgdXNlciBzcGFjZSBkcml2ZXIgZmlsbHMgdGhlbSwg
R1BVIGNvbnN1bWVzIHRoZW0pLCAKPiA+ICAgICAtLSBzZW1hcGhvcmVzIChoZXJlLCBhIEdQVS1j
ZW50cmljIHRlcm0sIHJhdGhlciB0aGFuIE9TLXR5cGU6IHRoZXNlIGFyZQo+ID4gICAgICAgIG1l
bW9yeSBsb2NhdGlvbnMgdGhhdCwgZm9yIGV4YW1wbGUsIHRoZSBHUFUgaGFyZHdhcmUgbWlnaHQg
d3JpdGUgdG8sIGluCj4gPiAgICAgICAgb3JkZXIgdG8gaW5kaWNhdGUgd29yayBjb21wbGV0aW9u
OyB0aGVyZSBhcmUgb3RoZXIgdXNlcyBhcyB3ZWxsKSwgCj4gPiAgICAgLS0gYSBmZXcgb3RoZXIg
dGhpbmdzIG1vc3QgbGlrZWx5ICh0aGlzIGlzIG5vdCBhIGNvbXBsZXRlIGxpc3QpLgo+IAo+IElz
IHRoYXQgYSA0MC1iaXQgdmlydHVhbCBhZGRyZXNzIGxpbWl0IG9yIHBoeXNpY2FsIGFkZHJlc3Mg
bGltaXQ/ICBJJ20KPiBubyBsb25nZXIgc3VyZSB3aG8gaXMgYWRkcmVzc2luZyB3aGF0IG1lbW9y
eSB0aHJvdWdoIHdoYXQgbWVjaGFuaXNtIDstKQo+IAoKVmlydHVhbCBhZGRyZXNzIGxpbWl0LCB0
aG9zZSBvYmplY3QgZ2V0IG1hcHBlZCBpbnRvIEdQVSBwYWdlIHRhYmxlIGJ1dAp0aGUgcmVnaXN0
ZXIvc3RydWN0dXJlIGZpZWxkcyB3aGVyZSB5b3UgcHJvZ3JhbSB0aG9zZSBvYmplY3QncyBhZGRy
ZXNzCm9ubHkgYXJlIDMyYml0cyAodGhlIHZpcnR1YWwgYWRkcmVzcyBpcyBzaGlmdGVkIGJ5IDhi
aXRzIGZvciBhbGlnbm1lbnQpLgoKQ2hlZXJzLApKw6lyw7RtZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
