From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98030] Stuttering video playback in totem after
 update to 1.19-rc1
Date: Fri, 14 Oct 2016 03:29:37 +0000
Message-ID: <bug-98030-8800-WtKEDr8uFs@http.bugs.freedesktop.org/>
References: <bug-98030-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1732158279=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98030-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1732158279==
Content-Type: multipart/alternative; boundary="14764157770.BdEf1d70.1242";
 charset="UTF-8"


--14764157770.BdEf1d70.1242
Date: Fri, 14 Oct 2016 03:29:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98030

Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ajax-TAsg7VrFCGc@public.gmane.org,
                   |                            |keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org

--- Comment #4 from Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org> ---
I bisected this to

commit 8f1edf4bd3a1f050ce9eeb5eac45dd1a8f7a6d5e
Author: Keith Packard <keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org>
Date:   Thu May 19 13:59:54 2016 -0700

    dix: Use list for ready clients

    This converts the dispatch loop into using a list of ready clients
    instead of an array. This changes the WaitForSomething API so that it
    notifies DIX when a client becomes ready to read, instead of returning
    the set of ready clients.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764157770.BdEf1d70.1242
Date: Fri, 14 Oct 2016 03:29:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:michel&#6=
4;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.net&gt;">=
 <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030">bug 98030<=
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
           <td>ajax&#64;nwnk.net, keithp&#64;keithp.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030">bug 98030<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>I bisected this to

commit 8f1edf4bd3a1f050ce9eeb5eac45dd1a8f7a6d5e
Author: Keith Packard &lt;<a href=3D"mailto:keithp&#64;keithp.com">keithp&#=
64;keithp.com</a>&gt;
Date:   Thu May 19 13:59:54 2016 -0700

    dix: Use list for ready clients

    This converts the dispatch loop into using a list of ready clients
    instead of an array. This changes the WaitForSomething API so that it
    notifies DIX when a client becomes ready to read, instead of returning
    the set of ready clients.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764157770.BdEf1d70.1242--

--===============1732158279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1732158279==--
