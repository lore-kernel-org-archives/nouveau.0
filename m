From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC mesa] nouveau: Add support for OpenCL global
	memory buffers
Date: Thu, 17 Mar 2016 17:07:47 +0100
Message-ID: <56EAD653.3000209@redhat.com>
References: <1457961752-1461-1-git-send-email-hdegoede@redhat.com>
 <CAKb7UvgcDxt0_GHr6W5zNvUwEY8FJSSfPD3wEhqr4t-3i5xPLg@mail.gmail.com>
 <56E6D8B1.60604@redhat.com> <56E6DBA2.8060605@gmail.com>
 <56E71623.7040201@redhat.com> <56E72426.8070606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56E72426.8070606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

SGksCgpPbiAxNC0wMy0xNiAyMTo1MCwgU2FtdWVsIFBpdG9pc2V0IHdyb3RlOgoKPHNuaXA+Cgo+
Pj4gQnR3LCBkbyB5b3UgbmVlZCBzb21lb25lIHdpdGggY29tbWl0IGFjY2VzcyB0byBwdXNoIHlv
dXIgcHJldmlvdXMKPj4+IHNlcmllcyAodGhlIHRnc2kgdGhpbmcpPyBJIGNhbiBkbyB0aGlzIGZv
ciB5b3UuCj4+Cj4+IFRoYW5rcyBmb3IgdGhlIG9mZmVyLiBJSVJDIElsaWEgd2FudGVkIHNvbWUg
bWlub3IgZml4ZXMgdGhlcmUsIHNvIEknbGwgZG8KPj4gYSB2MiB0b21vcnJvdy4gVGFsa2luZyBh
Ym91dCBjb21taXQgcmlnaHRzLCBJIGd1ZXNzIGl0IHdvdWxkIGJlCj4+IGNvbnZlbmllbnQgZm9y
IGFsbCBpZiBJIHdvdWxkIGdldCBjb21taXQgcmlnaHRzIG15c2VsZj8gSSBwcm9taXNlIEkgd29u
J3QKPj4gcHVzaCBhbnl0aGluZ3Mgd2l0aG91dCBhY2tzLgo+Cj4gWWVzIHN1cmUsIEkgdHJ1c3Qg
eW91LCBubyB3b3JyaWVzLiA6LSkKPgo+Pgo+PiBJIGFscmVhZHkgaGF2ZSBhIGZyZWVkZXNrdG9w
Lm9yZyBhY2NvdW50LCBteSB1c2VybmFtZSBpcyBqd3JkZWdvZWRlLgo+Cj4gUGxlYXNlIG9wZW4g
YSB0aWNrZXQgb24gYnVncy5mcmVlZGVza3RvcCB0byBhc2sgZm9yIGNvbW1pdCByaWdodHMuCgpE
b25lOgoKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9OTQ1OTQK
CkNhbiB5b3Ugb3IgSWxpYSBwbGVhc2UgYWNrIHRoaXMgPwoKVGhhbmtzLAoKSGFucwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
