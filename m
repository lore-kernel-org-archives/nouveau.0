From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85086] [NVE7] read/write faults leave machine
	unsuable
Date: Thu, 16 Oct 2014 18:09:11 +0000
Message-ID: <bug-85086-8800-HUxCZ2zM0S@http.bugs.freedesktop.org/>
References: <bug-85086-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2079660600=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85086-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2079660600==
Content-Type: multipart/alternative; boundary="1413482951.cca617F41.26356"; charset="UTF-8"


--1413482951.cca617F41.26356
Date: Thu, 16 Oct 2014 18:09:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85086

--- Comment #5 from tethys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 107942
  --> https://bugs.freedesktop.org/attachment.cgi?id=107942&action=edit
Full boot log (from journalctl -k -b bootid)

It's been doing this for a while, and I'd been advised to try a newer
kernel as there had apparently been a fair amount of nouveau related
improvements. So I tried various -rc kernels and now the final 3.17.0
kernel. It seems (although I don't have enough data to be certain)
that it's improved things slightly in that the crashes seem less
frequent now. But it obviously still crashes.

Reproducing it is simply a matter of waiting. If I leave the machine
overnight, there's a reasonable chance that it'll be crashed when I
get back into work the following morning. In terms of specific
behaviour to trigger the crash, then no, I can't really give any
information other than that I leave the machine basically idle
overnight, running one of the less demanding screensavers from
xscreensaver (cubicgrid).

I don't think it's an optimus setup, but I'm not familiar enough with
the Nvidia product range to say for sure. It's a PCI GeForce card in
a desktop machine.

By upgrading the ddx, I'm assuming you mean the xorg-x11-drv-nouveau
package? I'm already at the latest distribution supplied version (as
I am for mesa), but I guess I could look at compiling it from source
if you think it might help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413482951.cca617F41.26356
Date: Thu, 16 Oct 2014 18:09:11 +0000
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
   title="NEW - [NVE7] read/write faults leave machine unsuable"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85086#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] read/write faults leave machine unsuable"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85086">bug 85086</a>
              from <span class="vcard"><a class="email" href="mailto:tethys&#64;gmail.com" title="tethys&#64;gmail.com">tethys&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=107942" name="attach_107942" title="Full boot log (from journalctl -k -b bootid)">attachment 107942</a> <a href="attachment.cgi?id=107942&amp;action=edit" title="Full boot log (from journalctl -k -b bootid)">[details]</a></span>
Full boot log (from journalctl -k -b bootid)

It's been doing this for a while, and I'd been advised to try a newer
kernel as there had apparently been a fair amount of nouveau related
improvements. So I tried various -rc kernels and now the final 3.17.0
kernel. It seems (although I don't have enough data to be certain)
that it's improved things slightly in that the crashes seem less
frequent now. But it obviously still crashes.

Reproducing it is simply a matter of waiting. If I leave the machine
overnight, there's a reasonable chance that it'll be crashed when I
get back into work the following morning. In terms of specific
behaviour to trigger the crash, then no, I can't really give any
information other than that I leave the machine basically idle
overnight, running one of the less demanding screensavers from
xscreensaver (cubicgrid).

I don't think it's an optimus setup, but I'm not familiar enough with
the Nvidia product range to say for sure. It's a PCI GeForce card in
a desktop machine.

By upgrading the ddx, I'm assuming you mean the xorg-x11-drv-nouveau
package? I'm already at the latest distribution supplied version (as
I am for mesa), but I guess I could look at compiling it from source
if you think it might help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413482951.cca617F41.26356--

--===============2079660600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2079660600==--
