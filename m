From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70135] [nv34 PowerMac G5] gnome-shell random crashes
 and rendering issues
Date: Sun, 20 Oct 2013 15:19:18 +0000
Message-ID: <bug-70135-8800-YaQxZq3io7@http.bugs.freedesktop.org/>
References: <bug-70135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0038711656=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0038711656==
Content-Type: multipart/alternative; boundary="1382282358.c76cAd1.23538"; charset="us-ascii"


--1382282358.c76cAd1.23538
Date: Sun, 20 Oct 2013 15:19:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70135

--- Comment #19 from John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org> ---
Created attachment 87882
  --> https://bugs.freedesktop.org/attachment.cgi?id=87882&action=edit
Output of glxinfo for nv34 of PowerMac G5 Model A1047 with mesa-dri 9.1.7

Ok, after playing around a bit, I figured out that downgrading the
libgl1-mesa-dri package in Debian from 9.2.1 to 9.1.7 fixes the issue with
nouveau_dri.so not to be found and 3D acceleration and gnome-shell work as
expected again like it did with all mesa packages from unstable.

I guess it is an issue with the specific Debian package libgl1-mesa-dri from
experimental now and not mesa in general, even though the package actually
installs the nouveau_dri.so file at the expected location
(/usr/lib/powerpc-linux-gnu/dri/nouveau_dri.so).

I guess I wait until mesa 9.2.1 (or even 9.2.2) hits Debian unstable and I'll
try again.

Furthermore, I will also check the Debian bug tracker for libgl1-mesa-dri and
file a bug if necessary.

Cheers,

Adrian

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382282358.c76cAd1.23538
Date: Sun, 20 Oct 2013 15:19:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">bug 70135</a>
              from <span class="vcard"><a class="email" href="mailto:glaubitz&#64;physik.fu-berlin.de" title="John Paul Adrian Glaubitz &lt;glaubitz&#64;physik.fu-berlin.de&gt;"> <span class="fn">John Paul Adrian Glaubitz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87882" name="attach_87882" title="Output of glxinfo for nv34 of PowerMac G5 Model A1047 with mesa-dri 9.1.7">attachment 87882</a> <a href="attachment.cgi?id=87882&amp;action=edit" title="Output of glxinfo for nv34 of PowerMac G5 Model A1047 with mesa-dri 9.1.7">[details]</a></span>
Output of glxinfo for nv34 of PowerMac G5 Model A1047 with mesa-dri 9.1.7

Ok, after playing around a bit, I figured out that downgrading the
libgl1-mesa-dri package in Debian from 9.2.1 to 9.1.7 fixes the issue with
nouveau_dri.so not to be found and 3D acceleration and gnome-shell work as
expected again like it did with all mesa packages from unstable.

I guess it is an issue with the specific Debian package libgl1-mesa-dri from
experimental now and not mesa in general, even though the package actually
installs the nouveau_dri.so file at the expected location
(/usr/lib/powerpc-linux-gnu/dri/nouveau_dri.so).

I guess I wait until mesa 9.2.1 (or even 9.2.2) hits Debian unstable and I'll
try again.

Furthermore, I will also check the Debian bug tracker for libgl1-mesa-dri and
file a bug if necessary.

Cheers,

Adrian</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382282358.c76cAd1.23538--

--===============0038711656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0038711656==--
