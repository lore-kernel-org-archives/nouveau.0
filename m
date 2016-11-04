From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98457] [NVD9] GPU lockup after resume from
 hibernation with Nouveau driver and firmware-nonfree
Date: Fri, 04 Nov 2016 08:37:31 +0000
Message-ID: <bug-98457-8800-cDFvIuEX47@http.bugs.freedesktop.org/>
References: <bug-98457-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0820615859=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98457-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0820615859==
Content-Type: multipart/alternative; boundary="14782486510.E4e65eC67.27703";
 charset="UTF-8"


--14782486510.E4e65eC67.27703
Date: Fri, 4 Nov 2016 08:37:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98457

--- Comment #2 from wadev-cl+VPiYnx/0HWmgEVkV9KA@public.gmane.org ---
I've added #97462 as "related", since the symptom seems exactly the same.

The only difference is that while that one could have been reproduced - by =
me -
only with Firefox Beta && ESR and Google Maps, presumably with all
"force-enabled" settings, while suspend-to-disk and resume was unaffected,
this one is not reproduced by Firefox settings and websites, but instead
happens on each and every resume from hibernation.

For the inexperienced eye, it might just appear that the computer is almost
completely hung, with the desktop environment showing the time of the
hibernation, and the mouse cursor is the only symptom of actual functionali=
ty,
and even that is only for a while.

If, however, someone hibernates with "echo disk >/sys/power/state" from a r=
eal
console (not an X terminal), one gets the messages below.

This explanation above is mainly added for search engine indexing reasons, =
may
someone find their problem accordingly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14782486510.E4e65eC67.27703
Date: Fri, 4 Nov 2016 08:37:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] GPU lockup after resume from hibernation with Nouv=
eau driver and firmware-nonfree"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98457#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] GPU lockup after resume from hibernation with Nouv=
eau driver and firmware-nonfree"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98457">bug 98457<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wadev&#64;mailbox.hu" title=3D"wadev&#64;mailbox.hu">wadev&#64;mailbox.hu</=
a>
</span></b>
        <pre>I've added #97462 as &quot;related&quot;, since the symptom se=
ems exactly the same.

The only difference is that while that one could have been reproduced - by =
me -
only with Firefox Beta &amp;&amp; ESR and Google Maps, presumably with all
&quot;force-enabled&quot; settings, while suspend-to-disk and resume was un=
affected,
this one is not reproduced by Firefox settings and websites, but instead
happens on each and every resume from hibernation.

For the inexperienced eye, it might just appear that the computer is almost
completely hung, with the desktop environment showing the time of the
hibernation, and the mouse cursor is the only symptom of actual functionali=
ty,
and even that is only for a while.

If, however, someone hibernates with &quot;echo disk &gt;/sys/power/state&q=
uot; from a real
console (not an X terminal), one gets the messages below.

This explanation above is mainly added for search engine indexing reasons, =
may
someone find their problem accordingly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14782486510.E4e65eC67.27703--

--===============0820615859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0820615859==--
