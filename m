From: Luo Jinghua <sunmoon1997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pre-nv50 KMS
Date: Mon, 25 May 2009 21:22:52 +0800
Message-ID: <beb59a440905250622w156bd958w460babe635b7c182@mail.gmail.com>
References: <beb59a440905230149m2edc3f6ak3c61a45820a66c5f@mail.gmail.com>
	<beb59a440905230900x302478aoc3e9377c45d32b78@mail.gmail.com>
	<beb59a440905240227u181f817ck33274c4f2a755be3@mail.gmail.com>
	<6d4bc9fc0905240803m54402ce1r9754a6bafaf36c48@mail.gmail.com>
	<beb59a440905241701p4d25cf00jb059efdf187c41a7@mail.gmail.com>
	<1243210441.2864.5.camel@localhost.localdomain>
	<beb59a440905241908la3eb9b2ma158b402912b288e@mail.gmail.com>
	<1243220467.19524.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016364ef3d8de4f62046abc816b
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1243220467.19524.1.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--0016364ef3d8de4f62046abc816b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>> I'll try your tree once you published it. I get another issue, the DDX
>> driver don't hide the cursor on leaving vt and left the cursor on my
>> fb console. It may be already fixed in your local tree.
> Mmm, the DDX I was using was the same as what's now in git, so it'd be
> something on the kernel side. =C2=A0The cursor was hidden for me when I
> dropped back to a console however.
>

I did add some debug prints to drmmode_display.c. On leaving vt,
drmmode_hide_cursor never be called, the cursor isn't hidden.
I think it should be a right fix by adding xf86_hide_cursors into NVLeaveVT=
.
I have checked the intel driver. They also disable cursors on leaving vt.
I attached a patch which implements this idea.

> Testing would be good though, I don't have a (working) pre-nv5x laptop
> to test LVDS on anymore. =C2=A0Otherwise, from nv4 right through to nv4x
> seems good.
>

I happen to have a nv40 laptop. I'm happy to test your kms tree on my lapto=
p:).

--=20
Luo Jinghua

--0016364ef3d8de4f62046abc816b
Content-Type: application/octet-stream;
	name="0001-Hide-cursors-on-leaving-VT.patch"
Content-Disposition: attachment;
	filename="0001-Hide-cursors-on-leaving-VT.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fv5790f60

RnJvbSAwNTVhOGZmMzE3MDlkOGRmMjg0YWVjMjA2NTI4MGQ0OTk3NDE0OTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdW8gSmluZ2h1YSA8c3VubW9vbjE5OTdAZ21haWwuY29tPgpE
YXRlOiBNb24sIDI1IE1heSAyMDA5IDIwOjQ3OjI4ICswODAwClN1YmplY3Q6IFtQQVRDSF0gSGlk
ZSBjdXJzb3JzIG9uIGxlYXZpbmcgVlQKCk90aGVyd2lzZSB0aGUgWCBjdXJzb3Igd2lsbCBub3Qg
YmUgaGlkZGVuIG9uIG15IGZiIGNvbnNvbGUuIEkKaGF2ZSBjaGVja2VkIGludGVsIEREWCBkcml2
ZXIuIFRoZXkgYWxzbyBoaWRlIGN1cnNvcnMgb24gdGhlaXIKTGVhdmVWVCBoYW5kbGVyLgoKU2ln
bmVkLW9mZi1ieTogTHVvIEppbmdodWEgPHN1bm1vb24xOTk3QGdtYWlsLmNvbT4KLS0tCiBzcmMv
bnZfZHJpdmVyLmMgfCAgICAyICsrCiAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvbnZfZHJpdmVyLmMgYi9zcmMvbnZfZHJp
dmVyLmMKaW5kZXggMmIzYTU5Ni4uZTY5MWY4NiAxMDA2NDQKLS0tIGEvc3JjL252X2RyaXZlci5j
CisrKyBiL3NyYy9udl9kcml2ZXIuYwpAQCAtNzI2LDYgKzcyNiw4IEBAIE5WTGVhdmVWVChpbnQg
c2NybkluZGV4LCBpbnQgZmxhZ3MpCiAJCQlOVlJlc3RvcmUocFNjcm4pOwogCQllbHNlCiAJCQlO
VjUwUmVsZWFzZURpc3BsYXkocFNjcm4pOworCX0gZWxzZSB7CisJCXhmODZfaGlkZV9jdXJzb3Jz
IChwU2Nybik7CiAJfQogfQogCi0tIAoxLjYuMwoK
--0016364ef3d8de4f62046abc816b
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--0016364ef3d8de4f62046abc816b--
