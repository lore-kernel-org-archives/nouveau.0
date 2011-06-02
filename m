From: christopher bradski <chris.bradski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Nouveau Fermi Firmware
Date: Wed, 1 Jun 2011 22:59:31 -0700
Message-ID: <BANLkTikkN=sq8iop5yNJ1msXp1RXoxEZvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1926511141=="
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

--===============1926511141==
Content-Type: multipart/alternative; boundary=bcaec544ee303e1e2004a4b457a6

--bcaec544ee303e1e2004a4b457a6
Content-Type: text/plain; charset=ISO-8859-1

I have a GTS 450 and love the way nouveau runs in 2d, I was looking to test
3D and have extracted most of the firmware from the Nvidia blob.  Is
f841a1c4 the correct register to retrieve the fuc41ad firmware file? When I
try the following:

# insert correct register in next line
grep f841a1c4 ../mydump.txt \
| awk '{print $6}' | grep -oP '(?<=0x).*' | \
        python -c \
"
import struct; import sys; fd = open(\"fuc41ad\", \"wb\");
for line in sys.stdin:
        fd.write(struct.pack(\"@I\", int(line.rstrip(), 16)))
"
It results in the fuc41ad file being written as a text file with the date
Feb 12 2011 ? Is this correct? All three other firmware files are written as
binary files... I know a bit of python and bash but am drawing a blank on
this.

Thank you all in advance for any help. Much appreciated.

--bcaec544ee303e1e2004a4b457a6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have a GTS 450 and love the way nouveau runs in 2d, I was looking to test=
 3D and have extracted most of the firmware from the Nvidia blob.=A0 Is f84=
1a1c4 the correct register to retrieve the fuc41ad firmware file? When I tr=
y the following:<br>
<br># insert correct register in next line<br>grep f841a1c4 ../mydump.txt \=
<br>| awk &#39;{print $6}&#39; | grep -oP &#39;(?&lt;=3D0x).*&#39; | \<br>=
=A0=A0=A0=A0=A0=A0=A0 python -c \<br>&quot;<br>import struct; import sys; f=
d =3D open(\&quot;fuc41ad\&quot;, \&quot;wb\&quot;);<br>
for line in sys.stdin:<br>=A0=A0=A0=A0=A0=A0=A0 fd.write(struct.pack(\&quot=
;@I\&quot;, int(line.rstrip(), 16)))<br>&quot;<br>It results in the fuc41ad=
 file being written as a text file with the date Feb 12 2011 ? Is this corr=
ect? All three other firmware files are written as binary files... I know a=
 bit of python and bash but am drawing a blank on this. <br>
<br>Thank you all in advance for any help. Much appreciated. <br>

--bcaec544ee303e1e2004a4b457a6--

--===============1926511141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1926511141==--
