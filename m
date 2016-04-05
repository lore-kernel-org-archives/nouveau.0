From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94832] Reverse Prime corruption with nouveau using
 radeon outputs
Date: Tue, 05 Apr 2016 20:48:53 +0000
Message-ID: <bug-94832-8800-2gsMrLjKeN@http.bugs.freedesktop.org/>
References: <bug-94832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1707513300=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94832-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1707513300==
Content-Type: multipart/alternative; boundary="14598893321.7aA1D01B.18085";
 charset="UTF-8"


--14598893321.7aA1D01B.18085
Date: Tue, 5 Apr 2016 20:48:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94832

--- Comment #7 from Christoph Haag <haagch-7lD2lakjNIixeQ3y2VaiTg@public.gmane.org> ---
Created attachment 122737
  --> https://bugs.freedesktop.org/attachment.cgi?id=122737&action=edit
journal from running reverse prime from radeon

This may be a different problem, but when I try it the other way around by
adding /etc/X11/xorg.conf.d/20-radeon.conf with

Section "Device"
    Identifier     "Device0"
    Driver         "radeon"
    BusID          "PCI:2:0:0"
EndSection
Section "Device"
    Identifier     "Device1"
    Driver         "nouveau"
    BusID          "PCI:0:0:d"
EndSection

then X starts on my radeon gpu. Then I can do
xrandr --setprovideroutputsource radeon nouveau
and then
xrandr --output VGA-1-2 --auto --output DVI-0 --right-of VGA-1-2 --mode
1280x1024
then I get pretty gruesome messages in dmesg.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598893321.7aA1D01B.18085
Date: Tue, 5 Apr 2016 20:48:52 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832">bug 94832</a>
              from <span class="vcard"><a class="email" href="mailto:haagch&#64;frickel.club" title="Christoph Haag &lt;haagch&#64;frickel.club&gt;"> <span class="fn">Christoph Haag</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122737" name="attach_122737" title="journal from running reverse prime from radeon">attachment 122737</a> <a href="attachment.cgi?id=122737&amp;action=edit" title="journal from running reverse prime from radeon">[details]</a></span>
journal from running reverse prime from radeon

This may be a different problem, but when I try it the other way around by
adding /etc/X11/xorg.conf.d/20-radeon.conf with

Section &quot;Device&quot;
    Identifier     &quot;Device0&quot;
    Driver         &quot;radeon&quot;
    BusID          &quot;PCI:2:0:0&quot;
EndSection
Section &quot;Device&quot;
    Identifier     &quot;Device1&quot;
    Driver         &quot;nouveau&quot;
    BusID          &quot;PCI:0:0:d&quot;
EndSection

then X starts on my radeon gpu. Then I can do
xrandr --setprovideroutputsource radeon nouveau
and then
xrandr --output VGA-1-2 --auto --output DVI-0 --right-of VGA-1-2 --mode
1280x1024
then I get pretty gruesome messages in dmesg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598893321.7aA1D01B.18085--

--===============1707513300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1707513300==--
