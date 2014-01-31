From: pierre.morrow-GANU6spQydw@public.gmane.org
Subject: Help needed for bug 58556
Date: Fri, 31 Jan 2014 14:09:45 +0100 (CET)
Message-ID: <1930859494.395453948.1391173785548.JavaMail.root@spooler8-g27.priv.proxad.net>
References: <954328835.395384526.1391172165854.JavaMail.root@spooler8-g27.priv.proxad.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0749276068=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <954328835.395384526.1391172165854.JavaMail.root-x5ewXQG5twBsFmKuirFwRhh1pbbyJDp15NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0749276068==
Content-Type: multipart/alternative;
	boundary="----=_Part_395453947_1043382807.1391173785547"

------=_Part_395453947_1043382807.1391173785547
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello List, 

I am trying to solve bug 58556 [1], but I will need some help as I don't understand all that is going on. 

The system is composed of an NV96 (9600 GT) and an NVAC (9400 M) card; acceleration is disabled, otherwise the system hangs at boot after initialising the NV96 card. 
The problem consist of a complete garbage screen in console mode, and a one-third gabage screen in GUI. 

It appeared in commit 20abd1634a6e2eedb84ca977adea56b8aa06cc3e, as it was initialising some structures only when acceleration was on, even if it was later used in both cases. These structures changed in commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69, solving the initial issue but the problem still remains. 

After a few tests, it seems nouveau_channel_new is key to get a correct screen, though it is only called when acceleration is on; I didn't find which structures initialised by nouveau_channel_new are needed to get a clean screen, nor did I find any clues in debug messages. 

Does anyone have some clues about how it (should) works, or could give me some pointers? 

Thanks in advance for your help, 

Pierre Moreau 


[1]: https://bugs.freedesktop.org/show_bug.cgi?id=58556 

------=_Part_395453947_1043382807.1391173785547
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D'text/css'>p { margin: 0; }</style></head><body><=
div style=3D'font-family: arial,helvetica,sans-serif; font-size: 12pt; colo=
r: #000000'>Hello List,<br><br>I am trying to solve bug 58556 [1], but I wi=
ll need some help as I don't understand all that is going on.<br><br>The sy=
stem is composed of an NV96 (9600 GT) and an NVAC (9400 M) card; accelerati=
on is disabled, otherwise the system hangs at boot after initialising the N=
V96 card.<br>The problem consist of a complete garbage screen in console mo=
de, and a one-third gabage screen in GUI.<br><br>It appeared in commit 20ab=
d1634a6e2eedb84ca977adea56b8aa06cc3e, as it was initialising some structure=
s only when acceleration was on, even if it was later used in both cases. T=
hese structures changed in commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69,=
 solving the initial issue but the problem still remains.<br><br>After a fe=
w tests, it seems nouveau_channel_new is key to get a correct screen, thoug=
h it is only called when acceleration is on; I didn't find which structures=
 initialised by nouveau_channel_new are needed to get a clean screen, nor d=
id I find any clues in debug messages.<br><br>Does anyone have some clues a=
bout how it (should) works, or could give me some pointers?<br><br>Thanks i=
n advance for your help,<br><br>Pierre Moreau<br><br><br>[1]: https://bugs.=
freedesktop.org/show_bug.cgi?id=3D58556<br></div></body></html>
------=_Part_395453947_1043382807.1391173785547--

--===============0749276068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0749276068==--
