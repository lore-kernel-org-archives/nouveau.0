From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Thu, 28 Sep 2017 12:33:51 +0000
Message-ID: <bug-75985-8800-G2ZpNukYgF@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0796912302=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0796912302==
Content-Type: multipart/alternative; boundary="15066020300.9fF49.26529";
 charset="UTF-8"


--15066020300.9fF49.26529
Date: Thu, 28 Sep 2017 12:33:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hhfeuer-Mmb7MZpHnFY@public.gmane.org

--- Comment #13 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to Peter Wu from comment #12)
> On my laptop that area is somewhere after the AER
> capability and is all zeroes, it does not seem to make sense.

Why do you mention AER capability in this context? Are associated registers
normally the highest used in PCI config space? Could you give a hint on tha=
t?
Seen from a hardware perspective, this could make sense. Since the audio is
another PCI function not always needed, it sure has some enable pin on the =
chip
so it can be toggled or disabled by some external circuitry, vendor specifi=
c.
And some (reserved) gpio pin is used to make it switchable through software=
. So
maybe the config space >=3D0x400 being gpio space?
Wild guess, of course.
Interesting would be if after write, this can be read or returns zero again=
?=20
What about desktop cards, do they also have this register? Is this always s=
et
then?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15066020300.9fF49.26529
Date: Thu, 28 Sep 2017 12:33:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:hhfeuer&#=
64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> <span cla=
ss=3D"fn">Maik Freudenberg</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>hhfeuer&#64;gmx.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D75985#=
c12">comment #12</a>)
<span class=3D"quote">&gt; On my laptop that area is somewhere after the AER
&gt; capability and is all zeroes, it does not seem to make sense.</span >

Why do you mention AER capability in this context? Are associated registers
normally the highest used in PCI config space? Could you give a hint on tha=
t?
Seen from a hardware perspective, this could make sense. Since the audio is
another PCI function not always needed, it sure has some enable pin on the =
chip
so it can be toggled or disabled by some external circuitry, vendor specifi=
c.
And some (reserved) gpio pin is used to make it switchable through software=
. So
maybe the config space &gt;=3D0x400 being gpio space?
Wild guess, of course.
Interesting would be if after write, this can be read or returns zero again=
?=20
What about desktop cards, do they also have this register? Is this always s=
et
then?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15066020300.9fF49.26529--

--===============0796912302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0796912302==--
