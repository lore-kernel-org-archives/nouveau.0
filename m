From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Thu, 03 Oct 2013 18:10:46 +0000
Message-ID: <bug-69488-8800-Crec2JHRsq@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0106858352=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0106858352==
Content-Type: multipart/alternative; boundary="1380823846.E0Df1.28969"; charset="us-ascii"


--1380823846.E0Df1.28969
Date: Thu, 3 Oct 2013 18:10:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #17 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 87081
  --> https://bugs.freedesktop.org/attachment.cgi?id=87081&action=edit
dmesg 3.12-rc3 with nouveau.runpm=0

nouveau.runpm=0 gets me into Xorg.
I tried to use the nouveau card
#xrandr --setprovideroffloadsink nouveau Intel
#time DRI_PRIME=1 glxinfo
It shows its using nouveau but it takes a while to exit.
DRI_PRIME=1 glxinfo  14.29s user 122.64s system 100% cpu 2:16.82 total

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380823846.E0Df1.28969
Date: Thu, 3 Oct 2013 18:10:46 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87081" name="attach_87081" title="dmesg 3.12-rc3 with nouveau.runpm=0">attachment 87081</a> <a href="attachment.cgi?id=87081&amp;action=edit" title="dmesg 3.12-rc3 with nouveau.runpm=0">[details]</a></span>
dmesg 3.12-rc3 with nouveau.runpm=0

nouveau.runpm=0 gets me into Xorg.
I tried to use the nouveau card
#xrandr --setprovideroffloadsink nouveau Intel
#time DRI_PRIME=1 glxinfo
It shows its using nouveau but it takes a while to exit.
DRI_PRIME=1 glxinfo  14.29s user 122.64s system 100% cpu 2:16.82 total</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380823846.E0Df1.28969--

--===============0106858352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0106858352==--
