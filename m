From: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: properly check for _DSM function support and Optimus
 support for vga_switcheroo
Date: Mon, 9 Jan 2012 00:13:05 +0100
Message-ID: <CALBR5Zxuwv-zBQfVr7By3su2rjWjcVapX7oCCfeybjBMPY9cbA@mail.gmail.com>
References: <CALBR5ZxR9iuvT57bDZ8yW9ZkZjuoUhBTYw4HBsmsiwoRi4gSkw@mail.gmail.com>
	<CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw@mail.gmail.com>
	<CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA@mail.gmail.com>
	<CALBR5Zw0gEDqKrSUF3R30tSSC6DUgfhVm0Y1Mp60e4bB4ObijQ@mail.gmail.com>
	<CAG2kNCwBwRJ_VrS9NHnmGvOTTLuwmBKd5kG8OknJG+f20Kvqsg@mail.gmail.com>
	<CALBR5ZzZpnZp4=65tFv=_ZJfz+eaxxMLk-T-5hWzHUhwSf+U=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=bcaec5469349a75e4a04b60c6c2a
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CALBR5ZzZpnZp4=65tFv=_ZJfz+eaxxMLk-T-5hWzHUhwSf+U=w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--bcaec5469349a75e4a04b60c6c2a
Content-Type: multipart/alternative; boundary=bcaec5469349a75e4604b60c6c28

--bcaec5469349a75e4604b60c6c28
Content-Type: text/plain; charset=ISO-8859-1

Any activity on this? The newly attached patch contains one difference with
the previous
one: a dummy function has been added to avoid an error if ACPI is disabled.

Regards,
Lekensteyn

On Mon, Dec 19, 2011 at 2:26 PM, Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> A quickly written way to test this module is described for Ubuntu at
> http://pastebin.com/c5XqKSsW. Basically, you need to apply the patch on
> nouveau
> and rebuild the nouveau kernel module.
>
> A comparison of different methods that works for toggling the dGPU is
> available:
>
> https://github.com/Bumblebee-Project/Bumblebee/wiki/Comparison-of-PM-methods
>
> Regards,
> Lekensteyn
>
>
> On Mon, Dec 19, 2011 at 11:04 AM, Gianluca Cecchi <
> gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> >> On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> wrote:
>> >>>
>> >>> Hello guys,
>> >>>
>> >>> I've prepared a patch based on my findings for the bbswitch module
>> >>> (https://github.com/Lekensteyn/acpi-stuff/tree/master/bbswitch). This
>> >>> adds a proper
>> >>> check whether a _DSM function is supported or not and make OFF / ON
>> for
>> >>> vga_switcheroo work for nVidia Optimus models. The patch is based
>> against
>> >>> the
>> >>> mainline kernel.
>> >>>
>> >>> It has been tested on my Clevo B7130 laptop running kernel 3.2 which
>> has
>>
>> Hello,
>> I have an Asus U36SD laptop with Optimus and Fedora 16 with kernel
>> 3.1.5-6.fc16.x86_64
>> Any way I can test it?
>> Currently  I'm using acpi_call to switch off nvidia card and gain 4w
>> for more battery life.
>>
>> [g.cecchi@ope46 ~]$ lspci -vnnn|grep -i vga
>> 00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd
>> Generation Core Processor Family Integrated Graphics Controller
>> [8086:0126] (rev 09) (prog-if 00 [VGA controller])
>> 01:00.0 VGA compatible controller [0300]: nVidia Corporation Device
>> [10de:1050] (rev ff) (prog-if ff)
>>
>> What benefit would it give me? Chance to use nvidia for graphic
>> related apps ? With nouveau andor nvidia proprietary driver?
>> Thanks in advance for any pointer
>>
>> Gianluca
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>
>

--bcaec5469349a75e4604b60c6c28
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Any activity on this? The newly attached patch contains one difference with=
 the previous<br>one: a dummy function has been added to avoid an error if =
ACPI is disabled.<br><br>Regards,<br>Lekensteyn<br><br><div class=3D"gmail_=
quote">
On Mon, Dec 19, 2011 at 2:26 PM, Lekensteyn <span dir=3D"ltr">&lt;<a href=
=3D"mailto:lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
A quickly written way to test this module is described for Ubuntu at<br><a =
href=3D"http://pastebin.com/c5XqKSsW" target=3D"_blank">http://pastebin.com=
/c5XqKSsW</a>. Basically, you need to apply the patch on nouveau<br>and reb=
uild the nouveau kernel module.<br>

<br>A comparison of different methods that works for toggling the dGPU is a=
vailable:<br><a href=3D"https://github.com/Bumblebee-Project/Bumblebee/wiki=
/Comparison-of-PM-methods" target=3D"_blank">https://github.com/Bumblebee-P=
roject/Bumblebee/wiki/Comparison-of-PM-methods</a><br>


<br>Regards,<span class=3D"HOEnZb"><font color=3D"#888888"><br>Lekensteyn</=
font></span><div class=3D"HOEnZb"><div class=3D"h5"><br><br><div class=3D"g=
mail_quote">On Mon, Dec 19, 2011 at 11:04 AM, Gianluca Cecchi <span dir=3D"=
ltr">&lt;<a href=3D"mailto:gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">gia=
nluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div>&gt;&gt; On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn &lt;<a href=3D"ma=
ilto:lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; w=
rote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello guys,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve prepared a patch based on my findings for the bbswitc=
h module<br>
&gt;&gt;&gt; (<a href=3D"https://github.com/Lekensteyn/acpi-stuff/tree/mast=
er/bbswitch" target=3D"_blank">https://github.com/Lekensteyn/acpi-stuff/tre=
e/master/bbswitch</a>). This<br>
&gt;&gt;&gt; adds a proper<br>
&gt;&gt;&gt; check whether a _DSM function is supported or not and make OFF=
 / ON for<br>
&gt;&gt;&gt; vga_switcheroo work for nVidia Optimus models. The patch is ba=
sed against<br>
&gt;&gt;&gt; the<br>
&gt;&gt;&gt; mainline kernel.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It has been tested on my Clevo B7130 laptop running kernel 3.2=
 which has<br>
<br>
</div>Hello,<br>
I have an Asus U36SD laptop with Optimus and Fedora 16 with kernel<br>
3.1.5-6.fc16.x86_64<br>
Any way I can test it?<br>
Currently =A0I&#39;m using acpi_call to switch off nvidia card and gain 4w<=
br>
for more battery life.<br>
<br>
[g.cecchi@ope46 ~]$ lspci -vnnn|grep -i vga<br>
00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd<br>
Generation Core Processor Family Integrated Graphics Controller<br>
[8086:0126] (rev 09) (prog-if 00 [VGA controller])<br>
01:00.0 VGA compatible controller [0300]: nVidia Corporation Device<br>
[10de:1050] (rev ff) (prog-if ff)<br>
<br>
What benefit would it give me? Chance to use nvidia for graphic<br>
related apps ? With nouveau andor nvidia proprietary driver?<br>
Thanks in advance for any pointer<br>
<span><font color=3D"#888888"><br>
Gianluca<br>
</font></span><div><div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div></div></blockquote></div><br>
</div></div></blockquote></div><br>

--bcaec5469349a75e4604b60c6c28--

--bcaec5469349a75e4a04b60c6c2a
Content-Type: text/x-diff; charset=US-ASCII; name="nouveau-switcheroo-optimus.patch"
Content-Disposition: attachment; filename="nouveau-switcheroo-optimus.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gx6oed050

RnJvbSBiNmUxYjViMzE2YWUxN2NjYjdkZWYwYThiMzhlNjlhZDRjOTljNTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRlciBMZWtlbnN0ZXluIDxsZWtlbnN0ZXluQGdtYWlsLmNv
bT4KRGF0ZTogU2F0LCAxNyBEZWMgMjAxMSAxMjo1Mzo0MyArMDEwMApTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBub3V2ZWF1OiBwcm9wZXJseSBjaGVjayBmb3IgX0RTTSBmdW5jdGlvbiBzdXBwb3J0CgpB
Y2NvcmRpbmcgdG8gdGhlIEFDUEkgc3BlYyB2ZXJzaW9uIDQsIHNlY3Rpb24gOS4xNC4xLCBfRFNN
IGZ1bmN0aW9ucwptdXN0IHJldHVybiBhIHZhbHVlIHdpdGggdGhlIGZpcnN0IGJpdCBlbmFibGVk
IGlmIGFueSBEU00gZnVuY3Rpb25zIGFyZQpzdXBwb3J0ZWQgZm9yIHRoZSBnaXZlbiBVVUlEIGFu
ZCByZXZpc2lvbiBJRC4gRm9yIGEgZ2l2ZW4gZnVuY3Rpb24gaW5kZXggbgp0byBiZSBtYXJrZWQg
c3VwcG9ydGVkLCBiaXQgbiBtdXN0IGJlIGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBM
ZWtlbnN0ZXluIDxsZWtlbnN0ZXluQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2FjcGkuYyB8ICAgMzUgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LQogMSBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FjcGkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5jCmluZGV4IDUyNTc0NGQuLjk2NzU2ZDAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5jCkBAIC0xOCwxMiArMTgsNiBA
QAogCiAjaW5jbHVkZSA8bGludXgvdmdhX3N3aXRjaGVyb28uaD4KIAotI2RlZmluZSBOT1VWRUFV
X0RTTV9TVVBQT1JURUQgMHgwMAotI2RlZmluZSBOT1VWRUFVX0RTTV9TVVBQT1JURURfRlVOQ1RJ
T05TIDB4MDAKLQotI2RlZmluZSBOT1VWRUFVX0RTTV9BQ1RJVkUgMHgwMQotI2RlZmluZSBOT1VW
RUFVX0RTTV9BQ1RJVkVfUVVFUlkgMHgwMAotCiAjZGVmaW5lIE5PVVZFQVVfRFNNX0xFRCAweDAy
CiAjZGVmaW5lIE5PVVZFQVVfRFNNX0xFRF9TVEFURSAweDAwCiAjZGVmaW5lIE5PVVZFQVVfRFNN
X0xFRF9PRkYgMHgxMApAQCAtMzUsNiArMjksNyBAQAogI2RlZmluZSBOT1VWRUFVX0RTTV9QT1dF
Ul9TUEVFRCAweDAxCiAjZGVmaW5lIE5PVVZFQVVfRFNNX1BPV0VSX1NUQU1JTkEgMHgwMgogCisj
ZGVmaW5lIE5PVVZFQVVfRFNNX09QVElNVVNfRk4gMHgxQQogc3RhdGljIHN0cnVjdCBub3V2ZWF1
X2RzbV9wcml2IHsKIAlib29sIGRzbV9kZXRlY3RlZDsKIAlib29sIG9wdGltdXNfZGV0ZWN0ZWQ7
CkBAIC0xNDgsNiArMTQzLDIzIEBAIHN0YXRpYyBpbnQgbm91dmVhdV9kc20oYWNwaV9oYW5kbGUg
aGFuZGxlLCBpbnQgZnVuYywgaW50IGFyZywgdWludDMyX3QgKnJlc3VsdCkKIAlyZXR1cm4gMDsK
IH0KIAorLyogUmV0dXJucyAxIGlmIGEgRFNNIGZ1bmN0aW9uIGlzIHVzYWJsZSBhbmQgMCBvdGhl
cndpc2UgKi8KK3N0YXRpYyBpbnQgbm91dmVhdV90ZXN0X2RzbShhY3BpX2hhbmRsZSB0ZXN0X2hh
bmRsZSwKKwlpbnQgKCpkc21fZnVuYykoYWNwaV9oYW5kbGUsIGludCwgaW50LCB1aW50MzJfdCAq
KSwKKwlpbnQgc2ZuYykKK3sKKwl1MzIgcmVzdWx0ID0gMDsKKworCS8qIEZ1bmN0aW9uIDAgcmV0
dXJucyBhIEJ1ZmZlciBjb250YWluaW5nIGF2YWlsYWJsZSBmdW5jdGlvbnMuIFRoZSBhcmdzCisJ
ICogcGFyYW1ldGVyIGlzIGlnbm9yZWQgZm9yIGZ1bmN0aW9uIDAsIHNvIGp1c3QgcHV0IDAgaW4g
aXQgKi8KKwlpZiAoZHNtX2Z1bmModGVzdF9oYW5kbGUsIDAsIDAsICZyZXN1bHQpKQorCQlyZXR1
cm4gMDsKKworCS8qIEFDUEkgU3BlYyB2NCA5LjE0LjE6IGlmIGJpdCAwIGlzIHplcm8sIG5vIGZ1
bmN0aW9uIGlzIHN1cHBvcnRlZC4gSWYKKwkgKiB0aGUgbi10aCBiaXQgaXMgZW5hYmxlZCwgZnVu
Y3Rpb24gbiBpcyBzdXBwb3J0ZWQgKi8KKwlyZXR1cm4gcmVzdWx0ICYgMSAmJiByZXN1bHQgJiAo
MSA8PCBzZm5jKTsKK30KKwogc3RhdGljIGludCBub3V2ZWF1X2RzbV9zd2l0Y2hfbXV4KGFjcGlf
aGFuZGxlIGhhbmRsZSwgaW50IG11eF9pZCkKIHsKIAlteG1fd21pX2NhbGxfbXhteChtdXhfaWQg
PT0gTk9VVkVBVV9EU01fTEVEX1NUQU1JTkEgPyBNWE1fTVhEU19BREFQVEVSX0lHRCA6IE1YTV9N
WERTX0FEQVBURVJfMCk7CkBAIC0yMTIsOCArMjI0LDcgQEAgc3RhdGljIGludCBub3V2ZWF1X2Rz
bV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJYWNwaV9oYW5kbGUgZGhhbmRs
ZSwgbnZpZGlhX2hhbmRsZTsKIAlhY3BpX3N0YXR1cyBzdGF0dXM7Ci0JaW50IHJldCwgcmV0dmFs
ID0gMDsKLQl1aW50MzJfdCByZXN1bHQ7CisJaW50IHJldHZhbCA9IDA7CiAKIAlkaGFuZGxlID0g
REVWSUNFX0FDUElfSEFORExFKCZwZGV2LT5kZXYpOwogCWlmICghZGhhbmRsZSkKQEAgLTIyNCwx
MyArMjM1LDExIEBAIHN0YXRpYyBpbnQgbm91dmVhdV9kc21fcGNpX3Byb2JlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQogCQlyZXR1cm4gZmFsc2U7CiAJfQogCi0JcmV0ID0gbm91dmVhdV9kc20oZGhh
bmRsZSwgTk9VVkVBVV9EU01fU1VQUE9SVEVELAotCQkJICBOT1VWRUFVX0RTTV9TVVBQT1JURURf
RlVOQ1RJT05TLCAmcmVzdWx0KTsKLQlpZiAocmV0ID09IDApCisJaWYgKG5vdXZlYXVfdGVzdF9k
c20oZGhhbmRsZSwgbm91dmVhdV9kc20sIE5PVVZFQVVfRFNNX1BPV0VSKSkKIAkJcmV0dmFsIHw9
IE5PVVZFQVVfRFNNX0hBU19NVVg7CiAKLQlyZXQgPSBub3V2ZWF1X29wdGltdXNfZHNtKGRoYW5k
bGUsIDAsIDAsICZyZXN1bHQpOwotCWlmIChyZXQgPT0gMCkKKwlpZiAobm91dmVhdV90ZXN0X2Rz
bShkaGFuZGxlLCBub3V2ZWF1X29wdGltdXNfZHNtLAorCQlOT1VWRUFVX0RTTV9PUFRJTVVTX0ZO
KSkKIAkJcmV0dmFsIHw9IE5PVVZFQVVfRFNNX0hBU19PUFQ7CiAKIAlpZiAocmV0dmFsKQotLSAK
MS43LjUuNAoKCkZyb20gOWMxYTQ2NjMyMWM5YmRjNDRmYjQ1MjA1ZWJiNTQ2OWRhM2QyYWRiYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogUGV0ZXIgTGVrZW5zdGV5biA8bGVrZW5zdGV5
bkBnbWFpbC5jb20+CkRhdGU6IFNhdCwgMTcgRGVjIDIwMTEgMTI6NTQ6MDQgKzAxMDAKU3ViamVj
dDogW1BBVENIIDIvMl0gbm91dmVhdTogU3VwcG9ydCBPcHRpbXVzIG1vZGVscyBmb3IgdmdhX3N3
aXRjaGVyb28KCk5ld2VyIG5WaWRpYSBjYXJkcyB3aXRoIE9wdGltdXMgZG8gbm90IHN1cHBvcnQv
dXNlIHRoZSBEU00gc3dpdGNoaW5nIGZ1bmN0aW9ucy4KSW5zdGVhZCwgaXQgcmVxdWlyZSBhIERT
TSBmdW5jdGlvbiB0byBiZSBjYWxsZWQgcHJpb3IgdG8gYnJpbmdpbmcgYSBkZXZpY2UgaW50bwpE
MyBzdGF0ZS4gTm8gb3RoZXIgX0RTTSBjYWxscyBhcmUgbmVjZXNzYXJ5IGJlZm9yZS9hZnRlciBl
bmFibGluZy9kaXNhYmxpbmcgYQpkZXZpY2UuIFN3aXRjaGluZyBiZXR3ZWVuIGRpc2NyZXRlIGFu
ZCBpbnRlZ3JhdGVkIEdQVSBpcyBub3Qgc3VwcG9ydGVkIGJ5CnRoaXMgT3B0aW11cyBfRFNNIGNh
bGwsIHRoZXJlZm9yZSByZXR1cm4gb24gdGhlIHN3aXRjaGluZyBtZXRob2QuCgpTaWduZWQtb2Zm
LWJ5OiBQZXRlciBMZWtlbnN0ZXluIDxsZWtlbnN0ZXluQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FjcGkuYyAgfCAgIDQ0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCAgIHwg
ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N0YXRlLmMgfCAgICAxICsK
IDMgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FjcGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5jCmluZGV4IDk2NzU2ZDAuLjc4MTRhNzYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5jCkBAIC0zMCw2ICszMCw4IEBACiAj
ZGVmaW5lIE5PVVZFQVVfRFNNX1BPV0VSX1NUQU1JTkEgMHgwMgogCiAjZGVmaW5lIE5PVVZFQVVf
RFNNX09QVElNVVNfRk4gMHgxQQorI2RlZmluZSBOT1VWRUFVX0RTTV9PUFRJTVVTX0FSR1MgMHgw
MzAwMDAwMQorCiBzdGF0aWMgc3RydWN0IG5vdXZlYXVfZHNtX3ByaXYgewogCWJvb2wgZHNtX2Rl
dGVjdGVkOwogCWJvb2wgb3B0aW11c19kZXRlY3RlZDsKQEAgLTU2LDcgKzU4LDggQEAgc3RhdGlj
IGludCBub3V2ZWF1X29wdGltdXNfZHNtKGFjcGlfaGFuZGxlIGhhbmRsZSwgaW50IGZ1bmMsIGlu
dCBhcmcsIHVpbnQzMl90ICoKIAlzdHJ1Y3QgYWNwaV9vYmplY3RfbGlzdCBpbnB1dDsKIAl1bmlv
biBhY3BpX29iamVjdCBwYXJhbXNbNF07CiAJdW5pb24gYWNwaV9vYmplY3QgKm9iajsKLQlpbnQg
ZXJyOworCWludCBpLCBlcnI7CisJY2hhciBhcmdzX2J1ZmZbNF07CiAKIAlpbnB1dC5jb3VudCA9
IDQ7CiAJaW5wdXQucG9pbnRlciA9IHBhcmFtczsKQEAgLTY4LDcgKzcxLDExIEBAIHN0YXRpYyBp
bnQgbm91dmVhdV9vcHRpbXVzX2RzbShhY3BpX2hhbmRsZSBoYW5kbGUsIGludCBmdW5jLCBpbnQg
YXJnLCB1aW50MzJfdCAqCiAJcGFyYW1zWzJdLnR5cGUgPSBBQ1BJX1RZUEVfSU5URUdFUjsKIAlw
YXJhbXNbMl0uaW50ZWdlci52YWx1ZSA9IGZ1bmM7CiAJcGFyYW1zWzNdLnR5cGUgPSBBQ1BJX1RZ
UEVfQlVGRkVSOwotCXBhcmFtc1szXS5idWZmZXIubGVuZ3RoID0gMDsKKwlwYXJhbXNbM10uYnVm
ZmVyLmxlbmd0aCA9IDQ7CisJLyogQUNQSSBpcyBsaXR0bGUgZW5kaWFuLCBBQUJCQ0NERCBiZWNv
bWVzIHtERCxDQyxCQixBQX0gKi8KKwlmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKQorCQlhcmdzX2J1
ZmZbaV0gPSAoYXJnID4+IGkgKiA4KSAmIDB4RkY7CisJcGFyYW1zWzNdLmJ1ZmZlci5wb2ludGVy
ID0gYXJnc19idWZmOwogCiAJZXJyID0gYWNwaV9ldmFsdWF0ZV9vYmplY3QoaGFuZGxlLCAiX0RT
TSIsICZpbnB1dCwgJm91dHB1dCk7CiAJaWYgKGVycikgewpAQCAtMTgwLDYgKzE4NywxMCBAQCBz
dGF0aWMgaW50IG5vdXZlYXVfZHNtX3NldF9kaXNjcmV0ZV9zdGF0ZShhY3BpX2hhbmRsZSBoYW5k
bGUsIGVudW0gdmdhX3N3aXRjaGVybwogCiBzdGF0aWMgaW50IG5vdXZlYXVfZHNtX3N3aXRjaHRv
KGVudW0gdmdhX3N3aXRjaGVyb29fY2xpZW50X2lkIGlkKQogeworCS8qIHBlcmhhcHMgdGhlIF9E
U00gZnVuY3Rpb25zIGFyZSBtdXR1YWxseSBleGNsdXNpdmUsIGJ1dCBwcmVwYXJlIGZvcgorCSAq
IHRoZSBmdXR1cmUgKi8KKwlpZiAoIW5vdXZlYXVfZHNtX3ByaXYuZHNtX2RldGVjdGVkICYmIG5v
dXZlYXVfZHNtX3ByaXYub3B0aW11c19kZXRlY3RlZCkKKwkJcmV0dXJuIDA7CiAJaWYgKGlkID09
IFZHQV9TV0lUQ0hFUk9PX0lHRCkKIAkJcmV0dXJuIG5vdXZlYXVfZHNtX3N3aXRjaF9tdXgobm91
dmVhdV9kc21fcHJpdi5kaGFuZGxlLCBOT1VWRUFVX0RTTV9MRURfU1RBTUlOQSk7CiAJZWxzZQpA
QCAtMTkyLDYgKzIwMywxMSBAQCBzdGF0aWMgaW50IG5vdXZlYXVfZHNtX3Bvd2VyX3N0YXRlKGVu
dW0gdmdhX3N3aXRjaGVyb29fY2xpZW50X2lkIGlkLAogCWlmIChpZCA9PSBWR0FfU1dJVENIRVJP
T19JR0QpCiAJCXJldHVybiAwOwogCisJLyogT3B0aW11cyBsYXB0b3BzIGhhdmUgdGhlIGNhcmQg
YWxyZWFkeSBkaXNhYmxlZCBpbgorCSAqIG5vdXZlYXVfc3dpdGNoZXJvb19zZXRfc3RhdGUgKi8K
KwlpZiAoIW5vdXZlYXVfZHNtX3ByaXYuZHNtX2RldGVjdGVkICYmIG5vdXZlYXVfZHNtX3ByaXYu
b3B0aW11c19kZXRlY3RlZCkKKwkJcmV0dXJuIDA7CisKIAlyZXR1cm4gbm91dmVhdV9kc21fc2V0
X2Rpc2NyZXRlX3N0YXRlKG5vdXZlYXVfZHNtX3ByaXYuZGhhbmRsZSwgc3RhdGUpOwogfQogCkBA
IC0yNzgsMTUgKzI5NCwyMiBAQCBzdGF0aWMgYm9vbCBub3V2ZWF1X2RzbV9kZXRlY3Qodm9pZCkK
IAl9CiAKIAlpZiAodmdhX2NvdW50ID09IDIgJiYgaGFzX2RzbSAmJiBndWlkX3ZhbGlkKSB7Ci0J
CWFjcGlfZ2V0X25hbWUobm91dmVhdV9kc21fcHJpdi5kaGFuZGxlLCBBQ1BJX0ZVTExfUEFUSE5B
TUUsICZidWZmZXIpOworCQlhY3BpX2dldF9uYW1lKG5vdXZlYXVfZHNtX3ByaXYuZGhhbmRsZSwg
QUNQSV9GVUxMX1BBVEhOQU1FLAorCQkJJmJ1ZmZlcik7CiAJCXByaW50ayhLRVJOX0lORk8gIlZH
QSBzd2l0Y2hlcm9vOiBkZXRlY3RlZCBEU00gc3dpdGNoaW5nIG1ldGhvZCAlcyBoYW5kbGVcbiIs
Ci0JCSAgICAgICBhY3BpX21ldGhvZF9uYW1lKTsKKwkJCWFjcGlfbWV0aG9kX25hbWUpOwogCQlu
b3V2ZWF1X2RzbV9wcml2LmRzbV9kZXRlY3RlZCA9IHRydWU7CiAJCXJldCA9IHRydWU7CiAJfQog
Ci0JaWYgKGhhc19vcHRpbXVzID09IDEpCisJaWYgKGhhc19vcHRpbXVzID09IDEpIHsKKwkJYWNw
aV9nZXRfbmFtZShub3V2ZWF1X2RzbV9wcml2LmRoYW5kbGUsIEFDUElfRlVMTF9QQVRITkFNRSwK
KwkJCSZidWZmZXIpOworCQlwcmludGsoS0VSTl9JTkZPICJWR0Egc3dpdGNoZXJvbzogZGV0ZWN0
ZWQgT3B0aW11cyBEU00gbWV0aG9kICVzIGhhbmRsZVxuIiwKKwkJCWFjcGlfbWV0aG9kX25hbWUp
OwogCQlub3V2ZWF1X2RzbV9wcml2Lm9wdGltdXNfZGV0ZWN0ZWQgPSB0cnVlOworCQlyZXQgPSB0
cnVlOworCX0KIAogCXJldHVybiByZXQ7CiB9CkBAIC0zMDIsNiArMzI1LDE3IEBAIHZvaWQgbm91
dmVhdV9yZWdpc3Rlcl9kc21faGFuZGxlcih2b2lkKQogCXZnYV9zd2l0Y2hlcm9vX3JlZ2lzdGVy
X2hhbmRsZXIoJm5vdXZlYXVfZHNtX2hhbmRsZXIpOwogfQogCisvKiBNdXN0IGJlIGNhbGxlZCBm
b3IgT3B0aW11cyBtb2RlbHMgYmVmb3JlIHRoZSBjYXJkIGNhbiBiZSB0dXJuZWQgb2ZmICovCit2
b2lkIG5vdXZlYXVfc3dpdGNoZXJvb19vcHRpbXVzX2RzbSh2b2lkKQoreworCXUzMiByZXN1bHQg
PSAwOworCWlmICghbm91dmVhdV9kc21fcHJpdi5vcHRpbXVzX2RldGVjdGVkKQorCQlyZXR1cm47
CisKKwlub3V2ZWF1X29wdGltdXNfZHNtKG5vdXZlYXVfZHNtX3ByaXYuZGhhbmRsZSwgTk9VVkVB
VV9EU01fT1BUSU1VU19GTiwKKwkJTk9VVkVBVV9EU01fT1BUSU1VU19BUkdTLCAmcmVzdWx0KTsK
K30KKwogdm9pZCBub3V2ZWF1X3VucmVnaXN0ZXJfZHNtX2hhbmRsZXIodm9pZCkKIHsKIAl2Z2Ff
c3dpdGNoZXJvb191bnJlZ2lzdGVyX2hhbmRsZXIoKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2Rydi5oCmluZGV4IDRjMGJlM2EuLjRmMzY5ZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcnYuaApAQCAtMTA0MSwxMiArMTA0MSwxNCBAQCBleHRlcm4gaW50ICBub3V2ZWF1
X2RtYV93YWl0KHN0cnVjdCBub3V2ZWF1X2NoYW5uZWwgKiwgaW50IHNsb3RzLCBpbnQgc2l6ZSk7
CiAjaWYgZGVmaW5lZChDT05GSUdfQUNQSSkKIHZvaWQgbm91dmVhdV9yZWdpc3Rlcl9kc21faGFu
ZGxlcih2b2lkKTsKIHZvaWQgbm91dmVhdV91bnJlZ2lzdGVyX2RzbV9oYW5kbGVyKHZvaWQpOwor
dm9pZCBub3V2ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20odm9pZCk7CiBpbnQgbm91dmVhdV9h
Y3BpX2dldF9iaW9zX2NodW5rKHVpbnQ4X3QgKmJpb3MsIGludCBvZmZzZXQsIGludCBsZW4pOwog
Ym9vbCBub3V2ZWF1X2FjcGlfcm9tX3N1cHBvcnRlZChzdHJ1Y3QgcGNpX2RldiAqcGRldik7CiBp
bnQgbm91dmVhdV9hY3BpX2VkaWQoc3RydWN0IGRybV9kZXZpY2UgKiwgc3RydWN0IGRybV9jb25u
ZWN0b3IgKik7CiAjZWxzZQogc3RhdGljIGlubGluZSB2b2lkIG5vdXZlYXVfcmVnaXN0ZXJfZHNt
X2hhbmRsZXIodm9pZCkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBub3V2ZWF1X3VucmVnaXN0ZXJf
ZHNtX2hhbmRsZXIodm9pZCkge30KK3N0YXRpYyBpbmxpbmUgdm9pZCBub3V2ZWF1X3N3aXRjaGVy
b29fb3B0aW11c19kc20odm9pZCkge30KIHN0YXRpYyBpbmxpbmUgYm9vbCBub3V2ZWF1X2FjcGlf
cm9tX3N1cHBvcnRlZChzdHJ1Y3QgcGNpX2RldiAqcGRldikgeyByZXR1cm4gZmFsc2U7IH0KIHN0
YXRpYyBpbmxpbmUgaW50IG5vdXZlYXVfYWNwaV9nZXRfYmlvc19jaHVuayh1aW50OF90ICpiaW9z
LCBpbnQgb2Zmc2V0LCBpbnQgbGVuKSB7IHJldHVybiAtRUlOVkFMOyB9CiBzdGF0aWMgaW5saW5l
IGludCBub3V2ZWF1X2FjcGlfZWRpZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKSB7IHJldHVybiAtRUlOVkFMOyB9CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3N0YXRlLmMKaW5kZXggZDg4MzFhYi4uZWYyNzBjZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdGF0ZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3RhdGUuYwpAQCAtNTI1LDYgKzUyNSw3IEBAIHN0YXRp
YyB2b2lkIG5vdXZlYXVfc3dpdGNoZXJvb19zZXRfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYs
CiAJCXByaW50ayhLRVJOX0VSUiAiVkdBIHN3aXRjaGVyb286IHN3aXRjaGVkIG5vdXZlYXUgb2Zm
XG4iKTsKIAkJZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0NIQU5H
SU5HOwogCQlkcm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKKwkJbm91dmVhdV9zd2l0
Y2hlcm9vX29wdGltdXNfZHNtKCk7CiAJCW5vdXZlYXVfcGNpX3N1c3BlbmQocGRldiwgcG1tKTsK
IAkJZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX09GRjsKIAl9Ci0t
IAoxLjcuNS40Cgo=
--bcaec5469349a75e4a04b60c6c2a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--bcaec5469349a75e4a04b60c6c2a--
