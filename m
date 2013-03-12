From: Steven Ward <nightcast2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: vdpau problems and logging
Date: Tue, 12 Mar 2013 19:18:33 +0000
Message-ID: <CADXEQv8Ta0dUCeUxP4P5uJyNrfJ8qMfCvoXCF_7H0FAQpqtbEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c23a60d8054104d7bf2784
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--001a11c23a60d8054104d7bf2784
Content-Type: multipart/alternative; boundary=001a11c23a60d8053604d7bf2782

--001a11c23a60d8053604d7bf2782
Content-Type: text/plain; charset=ISO-8859-1

Dear all,
             I'm writing about  setup  vdpau firmware with  the nouveau
driver according to this page:

http://nouveau.freedesktop.org/wiki/NVC0_Firmware  I have  installed  the
nvidia-313 binary drver to attempt  to extract  the firmware. I have
obtained another mmiotrace  using  my  default  kernel I have installed  on
my Chakra  Distrobution.  I  have  used  the  instructions  on the  wiki
page.


I  had some mixed results using the instructions. I didn't get anywhere
with  using the demmio  from rnn  in envytools, but  I have  got some
output using  the demmio  command.

I will  be  uploading the output  in different files.  I did only once get
lucky with the last instructions, valgrind , but I can't seem to  get any
more "vuc" files. I hae saved the ones  I have and put them into
"/lib/firmware/nouveau"  and  I have copied  them into my external hardrive.

I  have tried  playing a  .mkv video which  I know it works  with the  313
binary driver.
I know it doesn't work  with  the  nouveau  driver and the "vuc" files I
extracted.

I will  upload  all  the  output I have created In tar.xz  format  attached
to a  series  of e-mails.

Regards,
              Steve555

--001a11c23a60d8053604d7bf2782
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:rgb(0,0,0)"><spa=
n style></span>Dear all,<br></span></div><span style=3D"background-color:rg=
b(0,0,0)">=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I&#39;m writing about=A0 set=
up=A0 vdpau firmware with=A0 the nouveau driver according to this page:<br>
<br><a href=3D"http://nouveau.freedesktop.org/wiki/NVC0_Firmware">http://no=
uveau.freedesktop.org/wiki/NVC0_Firmware</a>=A0 I have=A0 installed=A0 the =
nvidia-313 binary drver to attempt=A0 to extract=A0 the firmware. I have ob=
tained another mmiotrace=A0 using=A0 my=A0 default=A0 kernel I have install=
ed=A0 on my Chakra=A0 Distrobution.=A0 I=A0 have=A0 used=A0 the=A0 instruct=
ions=A0 on the=A0 wiki page.<br>
<br><br></span></div><div><span style=3D"background-color:rgb(0,0,0)">I=A0 =
had some mixed results using the instructions. I didn&#39;t get anywhere=A0=
 with=A0 using the demmio=A0 from rnn=A0 in envytools, but=A0 I have=A0 got=
 some=A0 output using=A0 the demmio=A0 command.<br>
<br></span></div><div><span style=3D"background-color:rgb(0,0,0)">I will=A0=
 be=A0 uploading the output=A0 in different files.=A0 I did only once get l=
ucky with the last instructions, valgrind , but I can&#39;t seem to=A0 get =
any=A0 more &quot;vuc&quot; files. I hae saved the ones=A0 I have and put t=
hem into=A0 &quot;/lib/firmware/nouveau&quot;=A0 and=A0 I have copied=A0 th=
em into my external hardrive.<br>
<br></span></div><div><span style=3D"background-color:rgb(0,0,0)">I=A0 have=
 tried=A0 playing a=A0 .mkv video which=A0 I know it works=A0 with the=A0 3=
13=A0 binary driver. <br></span></div><div><span style=3D"background-color:=
rgb(0,0,0)">I know it doesn&#39;t work=A0 with=A0 the=A0 nouveau=A0 driver =
and the &quot;vuc&quot; files I extracted.<br>
<br></span></div><div><span style=3D"background-color:rgb(0,0,0)">I will=A0=
 upload=A0 all=A0 the=A0 output I have created In tar.xz=A0 format=A0 attac=
hed to a=A0 series=A0 of e-mails.<br><br></span></div><div><span style=3D"b=
ackground-color:rgb(0,0,0)">Regards,<br>
</span></div><div><span style=3D"background-color:rgb(0,0,0)">=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 Steve555<br></span></div><span style=3D"backgro=
und-color:rgb(0,0,0)"></span><div><div><span style=3D"background-color:rgb(=
0,0,0)"><br></span></div></div>
</div>

--001a11c23a60d8053604d7bf2782--

--001a11c23a60d8054104d7bf2784
Content-Type: application/octet-stream; name=mplayer-vdpau-settings
Content-Disposition: attachment; filename=mplayer-vdpau-settings
Content-Transfer-Encoding: base64
X-Attachment-Id: f_he7fzjy20

IG1wbGF5ZXIgLXZjIGZmbXBlZzEydmRwYXUsZmZoMjY0dmRwYXUsZmZ3bXYzdmRwYXUsZmZ2YzF2
ZHBhdSxmZm9kaXZ4dmRwYXUsIGZpbGU6Ly8vaG9tZS9zdGV2ZS9WaWRlb3MvRGV2aWwtTWF5LUNy
eS1UaGUtQW5pbWUtY29tcGxldGUtT1NULU1LVi1EdWFsLUF1ZGlvL0RlTWFDcjAyLUhpZ2h3YXkt
U3Rhci5ta3YKIAogTVBsYXllcjIgVU5LTk9XTiAoQykgMjAwMC0yMDEyIE1QbGF5ZXIgVGVhbQpD
YW5ub3Qgb3BlbiBmaWxlICcvcm9vdC8ubXBsYXllci9pbnB1dC5jb25mJzogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQpGYWlsZWQgdG8gb3BlbiAvcm9vdC8ubXBsYXllci9pbnB1dC5jb25mLgoK
UGxheWluZyBmaWxlOi8vL2hvbWUvc3RldmUvVmlkZW9zL0RldmlsLU1heS1DcnktVGhlLUFuaW1l
LWNvbXBsZXRlLU9TVC1NS1YtRHVhbC1BdWRpby9EZU1hQ3IwMi1IaWdod2F5LVN0YXIubWt2Lgpb
bWt2XSBUcmFjayBJRCAxOiB2aWRlbyAoVl9NUEVHNC9JU08vQVZDKSwgLXZpZCAwCltta3ZdIFRy
YWNrIElEIDI6IGF1ZGlvIChBX0FBQyksIC1haWQgMCwgLWFsYW5nIGVuZwpbbWt2XSBUcmFjayBJ
RCAzOiBhdWRpbyAoQV9BQUMpLCAtYWlkIDEsIC1hbGFuZyBqcG4KW21rdl0gVHJhY2sgSUQgNDog
c3VidGl0bGVzIChTX1RFWFQvVVRGOCksIC1zaWQgMCwgLXNsYW5nIGVuZwpbbWt2XSBXaWxsIHBs
YXkgdmlkZW8gdHJhY2sgMS4KRGV0ZWN0ZWQgZmlsZSBmb3JtYXQ6IE1hdHJvc2thCkZvcmNlZCB2
aWRlbyBjb2RlYzogZmZtcGVnMTJ2ZHBhdQpGb3JjZWQgdmlkZW8gY29kZWM6IGZmaDI2NHZkcGF1
ClNlbGVjdGVkIHZpZGVvIGNvZGVjOiBILjI2NCAvIEFWQyAvIE1QRUctNCBBVkMgLyBNUEVHLTQg
cGFydCAxMCAoVkRQQVUgYWNjZWxlcmF0aW9uKSBbbGliYXZjb2RlY10KU2VsZWN0ZWQgYXVkaW8g
Y29kZWM6IEFBQyAoQWR2YW5jZWQgQXVkaW8gQ29kaW5nKSBbbGliYXZjb2RlY10KQVVESU86IDQ4
MDAwIEh6LCAyIGNoLCBzMTZsZSwgMTI4LjAga2JpdC84LjMzJSAocmF0aW86IDE2MDAwLT4xOTIw
MDApCkFPOiBbcHVsc2VdIEluaXQgZmFpbGVkOiBDb25uZWN0aW9uIHJlZnVzZWQKW0FPX0FMU0Fd
IGFsc2EtbGliOiBwY21faHcuYzoxMjkzOihzbmRfcGNtX2h3X29wZW4pIG9wZW4gJy9kZXYvc25k
L3BjbUMwRDBwJyBmYWlsZWQgKC0yKTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpbQU9fQUxT
QV0gYWxzYS1saWI6IHBjbV9kbWl4LmM6MTAxODooc25kX3BjbV9kbWl4X29wZW4pIHVuYWJsZSB0
byBvcGVuIHNsYXZlCltBT19BTFNBXSBQbGF5YmFjayBvcGVuIGVycm9yOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5CltBTyBPU1NdIGF1ZGlvX3NldHVwOiBDYW4ndCBvcGVuIGF1ZGlvIGRldmlj
ZSAvZGV2L2RzcDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpbSkFDS10gY2Fubm90IG9wZW4g
c2VydmVyCltBTyBTRExdIFNhbXBsZXJhdGU6IDQ4MDAwSHogQ2hhbm5lbHM6IFN0ZXJlbyBGb3Jt
YXQgczE2bGUKW0FPX0FMU0FdIGFsc2EtbGliOiBwY21faHcuYzoxMjkzOihzbmRfcGNtX2h3X29w
ZW4pIG9wZW4gJy9kZXYvc25kL3BjbUMwRDBwJyBmYWlsZWQgKC0yKTogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQpbQU9fQUxTQV0gYWxzYS1saWI6IHBjbV9kbWl4LmM6MTAxODooc25kX3BjbV9k
bWl4X29wZW4pIHVuYWJsZSB0byBvcGVuIHNsYXZlCltBTyBTRExdIFVuYWJsZSB0byBvcGVuIGF1
ZGlvOiBObyBhdmFpbGFibGUgYXVkaW8gZGV2aWNlCkFPOiBbbnVsbF0gNDgwMDBIeiAyY2ggczE2
bGUgKDIgYnl0ZXMgcGVyIHNhbXBsZSkKU3RhcnRpbmcgcGxheWJhY2suLi4KVklERU86ICA3MjB4
NDAwICAyMy45NzYgZnBzICAgIDAuMCBrYnBzICggMC4wIGtCL3MpClZPOiBbdmRwYXVdIDcyMHg0
MDAgPT4gNzIweDQwMCBILjI2NCBWRFBBVSBhY2NlbGVyYXRpb24gClt2ZHBhdV0gQ29tcG9zaXRp
bmcgd2luZG93IG1hbmFnZXIgZGV0ZWN0ZWQuIEFzc3VtaW5nIHRpbWluZyBpbmZvIGlzIGluYWNj
dXJhdGUuCkE6MTQ3MS4yIFY6MTQ3MC44IEEtVjogLTAuMDAwIGN0OiAgMC4wMDAgICAwLyAgMCAg
MCUgIDAlICAwLjQlIDIgMAo=
--001a11c23a60d8054104d7bf2784
Content-Type: application/octet-stream; name=nouveau-vdpau-output
Content-Disposition: attachment; filename=nouveau-vdpau-output
Content-Transfer-Encoding: base64
X-Attachment-Id: f_he7fzvik1

IFtzdGV2ZUBtZXJuaXZpYSBEZXZpbC1NYXktQ3J5LVRoZS1BbmltZS1jb21wbGV0ZS1PU1QtTUtW
LUR1YWwtQXVkaW9dJCBtcGxheWVyIC12YyBmZm1wZWcxMnZkcGF1LGZmaDI2NHZkcGF1LGZmd212
M3ZkcGF1LGZmdmMxdmRwYXUsZmZvZGl2eHZkcGF1LCBmaWxlOi8vL2hvbWUvc3RldmUvVmlkZW9z
L0RldmlsLU1heS1DcnktVGhlLUFuaW1lLWNvbXBsZXRlLU9TVC1NS1YtRHVhbC1BdWRpby9EZU1h
Q3IwMi1IaWdod2F5LVN0YXIubWt2Ck1QbGF5ZXIyIFVOS05PV04gKEMpIDIwMDAtMjAxMiBNUGxh
eWVyIFRlYW0KQ2Fubm90IG9wZW4gZmlsZSAnL2hvbWUvc3RldmUvLm1wbGF5ZXIvaW5wdXQuY29u
Zic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKRmFpbGVkIHRvIG9wZW4gL2hvbWUvc3RldmUv
Lm1wbGF5ZXIvaW5wdXQuY29uZi4KClBsYXlpbmcgZmlsZTovLy9ob21lL3N0ZXZlL1ZpZGVvcy9E
ZXZpbC1NYXktQ3J5LVRoZS1BbmltZS1jb21wbGV0ZS1PU1QtTUtWLUR1YWwtQXVkaW8vRGVNYUNy
MDItSGlnaHdheS1TdGFyLm1rdi4KW21rdl0gVHJhY2sgSUQgMTogdmlkZW8gKFZfTVBFRzQvSVNP
L0FWQyksIC12aWQgMApbbWt2XSBUcmFjayBJRCAyOiBhdWRpbyAoQV9BQUMpLCAtYWlkIDAsIC1h
bGFuZyBlbmcKW21rdl0gVHJhY2sgSUQgMzogYXVkaW8gKEFfQUFDKSwgLWFpZCAxLCAtYWxhbmcg
anBuCltta3ZdIFRyYWNrIElEIDQ6IHN1YnRpdGxlcyAoU19URVhUL1VURjgpLCAtc2lkIDAsIC1z
bGFuZyBlbmcKW21rdl0gV2lsbCBwbGF5IHZpZGVvIHRyYWNrIDEuCkRldGVjdGVkIGZpbGUgZm9y
bWF0OiBNYXRyb3NrYQpGYWlsZWQgdG8gb3BlbiBWRFBBVSBiYWNrZW5kIGxpYnZkcGF1X252aWRp
YS5zbzogY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Clt2ZHBhdV0gRXJyb3Igd2hlbiBjYWxsaW5nIHZkcF9kZXZpY2VfY3JlYXRlX3gxMTog
MQpbYXNzXSBhdXRvLW9wZW4KRm9yY2VkIHZpZGVvIGNvZGVjOiBmZm1wZWcxMnZkcGF1CkZvcmNl
ZCB2aWRlbyBjb2RlYzogZmZoMjY0dmRwYXUKU2VsZWN0ZWQgdmlkZW8gY29kZWM6IEguMjY0IC8g
QVZDIC8gTVBFRy00IEFWQyAvIE1QRUctNCBwYXJ0IDEwIChWRFBBVSBhY2NlbGVyYXRpb24pIFts
aWJhdmNvZGVjXQpTZWxlY3RlZCBhdWRpbyBjb2RlYzogQUFDIChBZHZhbmNlZCBBdWRpbyBDb2Rp
bmcpIFtsaWJhdmNvZGVjXQpBVURJTzogNDgwMDAgSHosIDIgY2gsIHMxNmxlLCAxMjguMCBrYml0
LzguMzMlIChyYXRpbzogMTYwMDAtPjE5MjAwMCkKQU86IFtwdWxzZV0gNDgwMDBIeiAyY2ggczE2
bGUgKDIgYnl0ZXMgcGVyIHNhbXBsZSkKU3RhcnRpbmcgcGxheWJhY2suLi4KVklERU86ICA3MjB4
NDAwICAyMy45NzYgZnBzICAgIDAuMCBrYnBzICggMC4wIGtCL3MpCkNvdWxkIG5vdCBmaW5kIG1h
dGNoaW5nIGNvbG9yc3BhY2UgLSByZXRyeWluZyB3aXRoIC12ZiBzY2FsZS4uLgpPcGVuaW5nIHZp
ZGVvIGZpbHRlcjogW3NjYWxlXQpUaGUgc2VsZWN0ZWQgdmlkZW9fb3V0IGRldmljZSBpcyBpbmNv
bXBhdGlibGUgd2l0aCB0aGlzIGNvZGVjLgpUcnkgYXBwZW5kaW5nIHRoZSBzY2FsZSBmaWx0ZXIg
dG8geW91ciBmaWx0ZXIgbGlzdCwKZS5nLiAtdmYgc3BwLHNjYWxlIGluc3RlYWQgb2YgLXZmIHNw
cC4KW2gyNjRfdmRwYXUgQCAweDdmMWNlMTkwMGJjMF1kZWNvZGluZyB0byBQSVhfRk1UX05PTkUg
aXMgbm90IHN1cHBvcnRlZC4KW2gyNjRfdmRwYXUgQCAweDdmMWNlMTkwMGJjMF1mZl9NUFZfY29t
bW9uX2luaXQoKSBmYWlsZWQuCltoMjY0X3ZkcGF1IEAgMHg3ZjFjZTE5MDBiYzBdZGVjb2RlX3Ns
aWNlX2hlYWRlciBlcnJvcgpbaDI2NF92ZHBhdSBAIDB4N2YxY2UxOTAwYmMwXW5vIGZyYW1lIQpF
cnJvciB3aGlsZSBkZWNvZGluZyBmcmFtZSEKCkZBVEFMOiBDb3VsZCBub3QgaW5pdGlhbGl6ZSB2
aWRlbyBmaWx0ZXJzICgtdmYpIG9yIHZpZGVvIG91dHB1dCAoLXZvCg==
--001a11c23a60d8054104d7bf2784
Content-Type: application/octet-stream; name=demmio-results
Content-Disposition: attachment; filename=demmio-results
Content-Transfer-Encoding: base64
X-Attachment-Id: f_he7g0iy32

IFswXSA2NDExLjU5MjAwMyBNTUlPMzIgVyAweDA4NDExMCAweDAwM2M3NjAwIFBCU1AuWEZFUl9F
WFRfQkFTRSA8PSAweDNjNzYwMDAwClswXSA2NDEyLjE1MTU1OCBNTUlPMzIgVyAweDA4NjExMCAw
eDAwM2M2ZTAwIFBQUFAuWEZFUl9FWFRfQkFTRSA8PSAweDNjNmUwMDAwCg==
--001a11c23a60d8054104d7bf2784
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c23a60d8054104d7bf2784--
