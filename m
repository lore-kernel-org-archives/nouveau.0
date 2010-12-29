From: Dule <karabaja4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Changing nouveau brightness and contrast settings
Date: Wed, 29 Dec 2010 12:26:34 +0100
Message-ID: <AANLkTinf+kYxujBwojEnXMMSLD7emYCLym+Q_0ODODrK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0557107177=="
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

--===============0557107177==
Content-Type: multipart/alternative; boundary=0016e645b932a2fd8f04988ad861

--0016e645b932a2fd8f04988ad861
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I have the following issue: my LCD monitor is broken and it's brightness and
contrast settings are way off. Integrated hardware controls don't work. This
issue forced me to change contrast and brightness settings using software,
which I can do with nvidia proprietary drivers from nvidia-xsettings tool.

However, I cannot seem to do the same with nouveau. There is no X or nouveau
tool to do such action, except xgamma which can change only gamma, and not
brightness or contrast.

I realize nouveau drivers are in it's early stages of development, so lack
of such tool is understandable. So, I looked at nouveau code to try and find
hard-coded brightness and contrast settings which I can change and just
recompile the drivers, but I have been unsuccessful. Only thing that I found
is this function:

nouveau_xv.c:

void
NVSetPortDefaults (ScrnInfoPtr pScrn, NVPortPrivPtr pPriv)
{
NVPtr pNv = NVPTR(pScrn);

pPriv->brightness = 0;
pPriv->contrast = 4096;
        //etc...
}

but I suspect these settings are related to rendering video and not X
rendering?

Anyway, I would appreciate your help for pointing me to the right part of
the code, or any other way I can circumvent this problem.

Many thanks,

Dule

--0016e645b932a2fd8f04988ad861
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<div><br></div><div>I have the following issue: my LCD monitor is bro=
ken and it&#39;s brightness and contrast settings are way off. Integrated h=
ardware controls don&#39;t work. This issue forced me to change contrast an=
d brightness settings using software, which I can do with=A0nvidia propriet=
ary drivers from=A0nvidia-xsettings tool.</div>

<div><br></div><div>However, I cannot seem to do the same with nouveau. The=
re is no X or nouveau tool to do such action, except xgamma which can chang=
e only gamma, and not brightness or contrast.</div><div><br></div><div>

I realize nouveau drivers are in it&#39;s early stages of development, so l=
ack of such tool is understandable. So, I looked at nouveau code to try and=
 find hard-coded brightness and contrast settings which I can change and ju=
st recompile the drivers, but I have been unsuccessful. Only thing that I f=
ound is this function:</div>

<div><br></div><div>nouveau_xv.c:</div><div><br></div><div><div>void</div><=
div>NVSetPortDefaults (ScrnInfoPtr pScrn, NVPortPrivPtr pPriv)</div><div>{<=
/div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=
NVPtr pNv =3D NVPTR(pScrn);</div>

<div><br></div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre=
">	</span>pPriv-&gt;brightness<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">		</span>=3D 0;</div><div><span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>pPriv-&gt;contrast<span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre">			</span>=3D 4096;</div>

<div>=A0=A0 =A0 =A0 =A0//etc...</div><div>}</div></div><div><br></div><div>=
but I suspect these settings are related to rendering video and not X rende=
ring?</div><div><br></div><div>Anyway, I would appreciate your help for poi=
nting me to the right part of the code, or any other way I can=A0circumvent=
 this problem.</div>

<div><br></div><div>Many thanks,</div><div><br></div><div>Dule</div>

--0016e645b932a2fd8f04988ad861--

--===============0557107177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0557107177==--
