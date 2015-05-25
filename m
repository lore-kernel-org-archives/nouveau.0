From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC PATCH 00/11] Implement ARB_cull_distance
Date: Mon, 25 May 2015 15:40:27 +0200
Message-ID: <5563264B.4010008@mni.thm.de>
References: <1432490289-29353-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <CAKb7UvjqEq9M639ZXhFeLqPjEVcP5Zfqc_Df7yjBA34ww70jMQ@mail.gmail.com>
 <556226F1.8020502@mni.thm.de>
 <CAKb7Uvgby-ycm5rQJWNJmC-4hkB2L9msgOiGh0YXNTBj+2-yaQ@mail.gmail.com>
 <55622D00.4000308@mni.thm.de>
 <CAAxE2A4Zc3G+Rw9VcaAcXj24RJvZsBY1hW6RDA=Mt+aO6s2nKw@mail.gmail.com>
 <CAPM=9tzeBhg-srEZgud4p3AUx59GAA7ogastm7Jy8erq1-0zzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tzeBhg-srEZgud4p3AUx59GAA7ogastm7Jy8erq1-0zzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ck9uIDI1LjA1LjIwMTUgMDc6MTcsIERhdmUgQWlybGllIHdyb3RlOgo+IE9uIDI1IE1heSAyMDE1
IGF0IDA4OjExLCBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwuY29tPiB3cm90ZToKPj4gSXQn
cyB0aGUgc2FtZSBvbiBSYWRlb24uIFRoZXJlIGFyZSAyeCBDbGlwT3JDdWxsRGlzdGFuY2Ugb3V0
cHV0Cj4+IHZlY3RvcnMgYW5kIGEgbWFzayBzYXlpbmcgaXQgc2hvdWxkIGNsaXAgb3IgY3VsbCBv
ciBkbyBub3RoaW5nLgo+Pgo+PiBNYXJlawo+Pgo+IE15IHRoaW5raW5nIHdhcyBnYWxsaXVtIHNo
b3VsZCBoYXZlIGEgc2luZ2xlIHNlbWFudGljIGFuZCBhIG1hc2sgaW4KPiB0aGUgc2hhZGVyIGRl
ZmluaXRpb24gbWF5YmUuCj4KPiB0aG91Z2ggaXQgZG9lc24ndCBzb2x2ZSB0aGUgZG9lcyBudmlk
aWEgZG8gdGhlIHJpZ2h0IHRoaW5nIHdpdGgKPiBjdWxsWzBdIGFuZCBjbGlwWzBdLCBhbmQgd2hh
dCBpcyB0aGUgcmlnaHQgdGhpbmcuCj4KPiBEYXZlLgoKSSdtIHN0aWxsIGNvbnZpbmNlZCB0aGF0
IGJvdGggY2xpcFswXSBhbmQgY3VsbFswXSBzaG91bGQgYmUgcG9zc2libGUuIApQbHVzIGkgaGF2
ZSB3cml0dGVuIGEgc2hhZGVyX3Rlc3QgZm9yIHRoaXMgYSB3aGlsZSBhZ28gd2hpY2ggeW91IHB1
c2hlZCAKdG8gcGlnbGl0IChmcy1jdWxsLWFuZC1jbGlwLWRpc3RhbmNlLWRpZmZlcmVudC5zaGFk
ZXJfdGVzdCkuIElmIGkgCnJlbWVtYmVyIHJpZ2h0IG52aWRpYSBwYXNzZWQgdGhhdCB0ZXN0IGp1
c3QgZmluZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
