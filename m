From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sun, 28 Jul 2013 01:39:46 +0000
Message-ID: <bug-67051-8800-eEn4fw0Poe@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0604927871=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0604927871==
Content-Type: multipart/alternative; boundary="1374975586.f2b321.18097"; charset="us-ascii"


--1374975586.f2b321.18097
Date: Sun, 28 Jul 2013 01:39:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #98 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 83110
  --> https://bugs.freedesktop.org/attachment.cgi?id=83110&action=edit
mthd-2.patch

Am I correct in understanding that you have a DVI-I, HDMI, and VGA connector on
your card?

Would you mind testing out

3.10.1 + hdmi-1.patch + hdminva3.patch + debug-1.patch + mthd-2.patch

and see if it still works? If not, I'd like to see the dmesg, and vbios
(/sys/kernel/debug/dri/0/vbios.rom)

(so basically same thing as last time, but mthd-2.patch instead of
mthd-1.patch... if you don't want to blow away your entire tree, you can do

patch -R -p1 < mthd-1.patch
patch -p1 < mthd-2.patch
)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374975586.f2b321.18097
Date: Sun, 28 Jul 2013 01:39:46 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c98">Comment # 98</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83110" name="attach_83110" title="mthd-2.patch">attachment 83110</a> <a href="attachment.cgi?id=83110&amp;action=edit" title="mthd-2.patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=67051&amp;attachment=83110'>[review]</a>
mthd-2.patch

Am I correct in understanding that you have a DVI-I, HDMI, and VGA connector on
your card?

Would you mind testing out

3.10.1 + hdmi-1.patch + hdminva3.patch + debug-1.patch + mthd-2.patch

and see if it still works? If not, I'd like to see the dmesg, and vbios
(/sys/kernel/debug/dri/0/vbios.rom)

(so basically same thing as last time, but mthd-2.patch instead of
mthd-1.patch... if you don't want to blow away your entire tree, you can do

patch -R -p1 &lt; mthd-1.patch
patch -p1 &lt; mthd-2.patch
)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374975586.f2b321.18097--

--===============0604927871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0604927871==--
