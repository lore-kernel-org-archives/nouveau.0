From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51362] [NVE7] DisplayPort output on nVidia Quadro
 K2000M (ThinkPad W530) doesn't work
Date: Mon, 02 Sep 2013 15:19:44 +0000
Message-ID: <bug-51362-8800-MQ7tzxoyz4@http.bugs.freedesktop.org/>
References: <bug-51362-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0553518446=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51362-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0553518446==
Content-Type: multipart/alternative; boundary="1378135184.aDc22.12495"; charset="us-ascii"


--1378135184.aDc22.12495
Date: Mon, 2 Sep 2013 15:19:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51362

--- Comment #17 from e.swanson+xorgbugs-5lA2vZBjcqn3oGB3hsPCZA@public.gmane.org ---
Created attachment 85067
  --> https://bugs.freedesktop.org/attachment.cgi?id=85067&action=edit
VBios dump on 3.11rc7

VBios dumped with:
# cat /sys/kernel/debug/dri/0/vbios.rom > vbios.rom

My attempt to dump with vbtracetool (as root this time :) failed - my machine
locked up and required a hard reboot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378135184.aDc22.12495
Date: Mon, 2 Sep 2013 15:19:44 +0000
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
   title="NEW --- - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362">bug 51362</a>
              from <span class="vcard"><a class="email" href="mailto:e.swanson+xorgbugs&#64;alloscomp.com" title="e.swanson+xorgbugs&#64;alloscomp.com">e.swanson+xorgbugs&#64;alloscomp.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85067" name="attach_85067" title="VBios dump on 3.11rc7">attachment 85067</a> <a href="attachment.cgi?id=85067&amp;action=edit" title="VBios dump on 3.11rc7">[details]</a></span>
VBios dump on 3.11rc7

VBios dumped with:
# cat /sys/kernel/debug/dri/0/vbios.rom &gt; vbios.rom

My attempt to dump with vbtracetool (as root this time :) failed - my machine
locked up and required a hard reboot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378135184.aDc22.12495--

--===============0553518446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0553518446==--
