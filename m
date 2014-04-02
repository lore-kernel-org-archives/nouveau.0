From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Wed, 02 Apr 2014 13:57:27 +0000
Message-ID: <bug-76732-8800-1v5EvjLjKR@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1796570907=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1796570907==
Content-Type: multipart/alternative; boundary="1396447046.51CD1.28170"; charset="us-ascii"


--1396447046.51CD1.28170
Date: Wed, 2 Apr 2014 13:57:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #28 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I dont't know if it is relevant, but in the hope of providing you some useful
information I saw that the interrupt storm starts when the last
nvbios_exec(&init) in nouveau/core/engine/disp/dport.c:dp_link_train_init is
called.

nvbios_exec(&init) is called with the initial offset of 0x5d7b and calls
following opcodes with respective offsets:

0x6e 0x5d7b
0x6e 0x5d88
0x6e 0x5d95
0x6e 0x5da2
0x6e 0x5daf
0x7a 0x5dbc
0x7a 0x5dc5
0x7a 0x5dce
0x6e 0x5dd7
0x74 0x5de4
0x5b 0x5de7

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396447046.51CD1.28170
Date: Wed, 2 Apr 2014 13:57:26 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>I dont't know if it is relevant, but in the hope of providing you some useful
information I saw that the interrupt storm starts when the last
nvbios_exec(&amp;init) in nouveau/core/engine/disp/dport.c:dp_link_train_init is
called.

nvbios_exec(&amp;init) is called with the initial offset of 0x5d7b and calls
following opcodes with respective offsets:

0x6e 0x5d7b
0x6e 0x5d88
0x6e 0x5d95
0x6e 0x5da2
0x6e 0x5daf
0x7a 0x5dbc
0x7a 0x5dc5
0x7a 0x5dce
0x6e 0x5dd7
0x74 0x5de4
0x5b 0x5de7</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396447046.51CD1.28170--

--===============1796570907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1796570907==--
