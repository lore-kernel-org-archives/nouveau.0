From: younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: nouveaufb problems with NV18
Date: Fri, 11 Mar 2011 20:16:38 +0000
Message-ID: <20cf304346f0aae407049e3aa3fa@google.com>
References: <20110311152718.19243.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312164639=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110311152718.19243.qmail-FT9nftu9LUyCkawlElnc8EEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0312164639==
Content-Type: multipart/alternative; boundary=20cf304346f0aae3d9049e3aa3f7

--20cf304346f0aae3d9049e3aa3f7
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

On , George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org> wrote:
> Thanks for the reply! Sorry it took me a day to respond.



> > Is there anything at all connected to the other output (referred to as  
> TV-1

> > in your log)? You can try disabling TV detection with the tv_disable

> > nouveau.ko module parameter if a non-existent TV is somehow being  
> detected.



> No, nothing. Adding the parameter (it's actually tv_disable=1; required

> a couple of reboots since the module's loaded early and can't be unloaded)

> produced a full-screen console (67x240), but with the same "flashing"

> to the right on system activity. (I don't get it on VC switch now,  
> however!)



> Also, the display (DVI-D) appears to be half a line low. Tall characters

> ($ and ^) on the top line have their topmost row of pixels replicated  
> into a

> vertical stripe, and the bottom row of text is only half visible.

> (Actually a little more than half; both bars of = are visible.)



> X still refuses to start; messages attached.

> ...
> [ 40726.087] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
> ...

I think someone else had the above problem on an NV1x card as well recently  
and tried to debug it. Not sure about your fb related issues though, that  
might be a separate issue. You can open a bug against nouveau at  
bugs.freedesktop.org, hopefully someone can assist you further.

--20cf304346f0aae3d9049e3aa3f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On , George Spelvin &lt;linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br />&gt; Thanks for t=
he reply! =A0Sorry it took me a day to respond.<br />&gt; <br />&gt; <br />=
&gt; <br />&gt; &gt; Is there anything at all connected to the other output=
 (referred to as TV-1<br />&gt; <br />&gt; &gt; in your log)? You can try d=
isabling TV detection with the tv_disable<br />&gt; <br />&gt; &gt; nouveau=
.ko module parameter if a non-existent TV is somehow being detected.<br />&=
gt; <br />&gt; <br />&gt; <br />&gt; No, nothing. =A0Adding the parameter (=
it&#39;s actually tv_disable=3D1; required<br />&gt; <br />&gt; a couple of=
 reboots since the module&#39;s loaded early and can&#39;t be unloaded)<br =
/>&gt; <br />&gt; produced a full-screen console (67x240), but with the sam=
e &quot;flashing&quot;<br />&gt; <br />&gt; to the right on system activity=
. =A0(I don&#39;t get it on VC switch now, however!)<br />&gt; <br />&gt; <=
br />&gt; <br />&gt; Also, the display (DVI-D) appears to be half a line lo=
w. =A0Tall characters<br />&gt; <br />&gt; ($ and ^) on the top line have t=
heir topmost row of pixels replicated into a<br />&gt; <br />&gt; vertical =
stripe, and the bottom row of text is only half visible.<br />&gt; <br />&g=
t; (Actually a little more than half; both bars of =3D are visible.)<br />&=
gt; <br />&gt; <br />&gt; <br />&gt; X still refuses to start; messages att=
ached.<br />&gt; <br />&gt; ...<br />&gt; [ 40726.087] (EE) NOUVEAU(0): Err=
or allocating scanout buffer: 0<br />&gt; ...<br /><br />I think someone el=
se had the above problem on an NV1x card as well recently and tried to debu=
g it. Not sure about your fb related issues though, that might be a separat=
e issue. You can open a bug against nouveau at bugs.freedesktop.org, hopefu=
lly someone can assist you further.
--20cf304346f0aae3d9049e3aa3f7--

--===============0312164639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0312164639==--
