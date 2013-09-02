From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] Unknown opcode 0x43 + protection fault on a
 Graphics Blaster Riva TNT card
Date: Mon, 02 Sep 2013 09:24:07 +0000
Message-ID: <bug-68835-8800-t7xOwJNH3l@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0659519691=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0659519691==
Content-Type: multipart/alternative; boundary="1378113847.5A057Dee1.18387"; charset="us-ascii"


--1378113847.5A057Dee1.18387
Date: Mon, 2 Sep 2013 09:24:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

--- Comment #2 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Created attachment 85050
  --> https://bugs.freedesktop.org/attachment.cgi?id=85050&action=edit
BIOS dump obtained with vbtracetool

I'm also attaching the BIOS dump obtained from vbtracetool, as requested,
although it seems to be equal to the one from /sys/kernel/debug/dri/0/vbios.rom
(just a single character differs).

Let me know if you also need the POST trace.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378113847.5A057Dee1.18387
Date: Mon, 2 Sep 2013 09:24:07 +0000
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
   title="NEW --- - Unknown opcode 0x43 + protection fault on a Graphics Blaster Riva TNT card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Unknown opcode 0x43 + protection fault on a Graphics Blaster Riva TNT card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85050" name="attach_85050" title="BIOS dump obtained with vbtracetool">attachment 85050</a> <a href="attachment.cgi?id=85050&amp;action=edit" title="BIOS dump obtained with vbtracetool">[details]</a></span>
BIOS dump obtained with vbtracetool

I'm also attaching the BIOS dump obtained from vbtracetool, as requested,
although it seems to be equal to the one from /sys/kernel/debug/dri/0/vbios.rom
(just a single character differs).

Let me know if you also need the POST trace.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378113847.5A057Dee1.18387--

--===============0659519691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0659519691==--
