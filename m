From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61069] [NV17] Crash while displaying large image
Date: Sat, 07 Dec 2013 08:17:05 +0000
Message-ID: <bug-61069-8800-S0NJLlXYCI@http.bugs.freedesktop.org/>
References: <bug-61069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1767231423=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1767231423==
Content-Type: multipart/alternative; boundary="1386404225.234f4Ee2.8927"; charset="us-ascii"


--1386404225.234f4Ee2.8927
Date: Sat, 7 Dec 2013 08:17:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61069

--- Comment #7 from dave.mueller-OI3hZJvNYWs@public.gmane.org ---
In the meantime i updated my system (kernel 3.12, X Server 1.14.3,
nouveau_drv.so module version = 1.0.9) and the crash with the 3200x2700 picture
is gone. 

But i see the following lines in the kernel logs:

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1287]] get 0xbeef0200
put 0x00022a9c state 0xc000018c (err: MEM_FAULT) push 0x00000000
nouveau E[ X[1287]] reloc wait_idle failed: -16
nouveau E[ X[1287]] reloc apply: -16

which seems to be accompanied by a short "hang" of the GUI.

Unfortunately these "hangs" seem not only be triggered by my synthetic test
case, but also by normal daily work. 

The system seems to be able to recover from this state but from time to time
(mostly if the system is under load) this results in a complete GUI freeze and
i need to reboot the whole system.

But i am not sure if this is just a new symptom of the same problem or a
totally unrelated new problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386404225.234f4Ee2.8927
Date: Sat, 7 Dec 2013 08:17:05 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069">bug 61069</a>
              from <span class="vcard"><a class="email" href="mailto:dave.mueller&#64;gmx.ch" title="dave.mueller&#64;gmx.ch">dave.mueller&#64;gmx.ch</a>
</span></b>
        <pre>In the meantime i updated my system (kernel 3.12, X Server 1.14.3,
nouveau_drv.so module version = 1.0.9) and the crash with the 3200x2700 picture
is gone. 

But i see the following lines in the kernel logs:

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1287]] get 0xbeef0200
put 0x00022a9c state 0xc000018c (err: MEM_FAULT) push 0x00000000
nouveau E[ X[1287]] reloc wait_idle failed: -16
nouveau E[ X[1287]] reloc apply: -16

which seems to be accompanied by a short &quot;hang&quot; of the GUI.

Unfortunately these &quot;hangs&quot; seem not only be triggered by my synthetic test
case, but also by normal daily work. 

The system seems to be able to recover from this state but from time to time
(mostly if the system is under load) this results in a complete GUI freeze and
i need to reboot the whole system.

But i am not sure if this is just a new symptom of the same problem or a
totally unrelated new problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386404225.234f4Ee2.8927--

--===============1767231423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1767231423==--
