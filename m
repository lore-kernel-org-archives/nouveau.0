From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76818] [NVE7] GPU lockup
Date: Sat, 12 Apr 2014 01:06:26 +0000
Message-ID: <bug-76818-8800-AHf4jWv3Qv@http.bugs.freedesktop.org/>
References: <bug-76818-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0100953426=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76818-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0100953426==
Content-Type: multipart/alternative; boundary="1397264786.def83.21097"; charset="us-ascii"


--1397264786.def83.21097
Date: Sat, 12 Apr 2014 01:06:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76818

--- Comment #8 from jw.hendy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
@Max: can you confirm that this was only an issue due to two minotors? I'm
trying to decide if my similar issue is a replicate or if not since I'm simply
on a laptop here, no additional monitor issue.

@Ilia: I was experiencing similar issues (GPU Lockup, switching to fbcon in
dmesg) and system failure on `startx` back in Oct 2013. Here's an example log
after issuing `startx`:
- http://pastebin.com/qVY7WznX

I'm on Arch Linux and tried nouveau + the AUR nouveau-fw package (basically a
packaged version of nouveau's VideoAcceleration instructions), but was still
getting issues. Here's two dmesg outputs:
- http://pastebin.com/dV7gHS61
- http://pastebin.com/ZsCQmEwQ

I have been getting overheating cores and failure to suspend on lid close
lately, which prompted me to see about returning to nouveau and I found this
post. Your suggestion of:

nouveau.config=NvGrUseFw=1

Seems to have worked! I need to reboot once more to verify, as I'm on linux-lts
kernel (3.10.36) at the moment, but this was the first time I was able to
`startx` with nouveau and did not see the GPU lockup message in dmesg.

I'm trying to understand why this kernel line is necessary. I haven't seen it
at all before, either on the Arch Wiki or in the nouveau firmware instructions.
In fact, in googling it, I find primarily hits on bug reports regarding GPU
lockups! I'd think this would be more widespread in setup/debugging
instructions.

Thanks for any feedback -- I'd like to get information from someone who knows
and then update the Arch Wiki with this information in case it affects others.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397264786.def83.21097
Date: Sat, 12 Apr 2014 01:06:26 +0000
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
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818">bug 76818</a>
              from <span class="vcard"><a class="email" href="mailto:jw.hendy&#64;gmail.com" title="jw.hendy&#64;gmail.com">jw.hendy&#64;gmail.com</a>
</span></b>
        <pre>&#64;Max: can you confirm that this was only an issue due to two minotors? I'm
trying to decide if my similar issue is a replicate or if not since I'm simply
on a laptop here, no additional monitor issue.

&#64;Ilia: I was experiencing similar issues (GPU Lockup, switching to fbcon in
dmesg) and system failure on `startx` back in Oct 2013. Here's an example log
after issuing `startx`:
- <a href="http://pastebin.com/qVY7WznX">http://pastebin.com/qVY7WznX</a>

I'm on Arch Linux and tried nouveau + the AUR nouveau-fw package (basically a
packaged version of nouveau's VideoAcceleration instructions), but was still
getting issues. Here's two dmesg outputs:
- <a href="http://pastebin.com/dV7gHS61">http://pastebin.com/dV7gHS61</a>
- <a href="http://pastebin.com/ZsCQmEwQ">http://pastebin.com/ZsCQmEwQ</a>

I have been getting overheating cores and failure to suspend on lid close
lately, which prompted me to see about returning to nouveau and I found this
post. Your suggestion of:

nouveau.config=NvGrUseFw=1

Seems to have worked! I need to reboot once more to verify, as I'm on linux-lts
kernel (3.10.36) at the moment, but this was the first time I was able to
`startx` with nouveau and did not see the GPU lockup message in dmesg.

I'm trying to understand why this kernel line is necessary. I haven't seen it
at all before, either on the Arch Wiki or in the nouveau firmware instructions.
In fact, in googling it, I find primarily hits on bug reports regarding GPU
lockups! I'd think this would be more widespread in setup/debugging
instructions.

Thanks for any feedback -- I'd like to get information from someone who knows
and then update the Arch Wiki with this information in case it affects others.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397264786.def83.21097--

--===============0100953426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0100953426==--
