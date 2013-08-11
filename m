From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] Hardware freeze after resume from suspend
Date: Sun, 11 Aug 2013 15:51:55 +0000
Message-ID: <bug-67878-8800-KWYY21G9Me@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0344929734=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0344929734==
Content-Type: multipart/alternative; boundary="1376236315.B7fB51.19663"; charset="us-ascii"


--1376236315.B7fB51.19663
Date: Sun, 11 Aug 2013 15:51:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #31 from Ben Gamari <bgamari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 83943
  --> https://bugs.freedesktop.org/attachment.cgi?id=83943&action=edit
dmesg output from a few failed suspend/resume attempts with 4f6029da

In this case I logged in and suspended the machine. Upon resuming, the X
session was frozen with the cursor being updated occassionally. After several
attempts I was able to get to a VT. Shortly thereafter the X server died,
causing lightdm to respawn a greeter which functioned correctly, presumably
because it doesn't require acceleration. I could log in again, also the X
session would freeze before getting to a functional desktop (presumably upon
compiz starting). Again, with a few tries I could get back to a VT, at which
point lightdm would start a greeter. With every freeze a "failed to idle
channel 0xcccc0000" message would be dumped to dmesg.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376236315.B7fB51.19663
Date: Sun, 11 Aug 2013 15:51:55 +0000
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
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:bgamari&#64;gmail.com" title="Ben Gamari &lt;bgamari&#64;gmail.com&gt;"> <span class="fn">Ben Gamari</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83943" name="attach_83943" title="dmesg output from a few failed suspend/resume attempts with 4f6029da">attachment 83943</a> <a href="attachment.cgi?id=83943&amp;action=edit" title="dmesg output from a few failed suspend/resume attempts with 4f6029da">[details]</a></span>
dmesg output from a few failed suspend/resume attempts with 4f6029da

In this case I logged in and suspended the machine. Upon resuming, the X
session was frozen with the cursor being updated occassionally. After several
attempts I was able to get to a VT. Shortly thereafter the X server died,
causing lightdm to respawn a greeter which functioned correctly, presumably
because it doesn't require acceleration. I could log in again, also the X
session would freeze before getting to a functional desktop (presumably upon
compiz starting). Again, with a few tries I could get back to a VT, at which
point lightdm would start a greeter. With every freeze a &quot;failed to idle
channel 0xcccc0000&quot; message would be dumped to dmesg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376236315.B7fB51.19663--

--===============0344929734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0344929734==--
