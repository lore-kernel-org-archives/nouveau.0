From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56535] Resident evil 4 with wine: crash
Date: Thu, 01 Nov 2012 21:54:05 +0000
Message-ID: <bug-56535-8800-Z1FxWFHA10@http.bugs.freedesktop.org/>
References: <bug-56535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2108103995=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2108103995==
Content-Type: multipart/alternative; boundary="1351806844.B4cfAe621.26001"; charset="us-ascii"


--1351806844.B4cfAe621.26001
Date: Thu, 1 Nov 2012 21:54:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56535

--- Comment #4 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> ---
The better command:
$ echo "c" | WINEDEBUG=-dbghelp_dwarf winedbg --gdb game.exe

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351806844.B4cfAe621.26001
Date: Thu, 1 Nov 2012 21:54:04 +0000
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
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535">bug 56535</a>
              from <span class="vcard"><a class="email" href="mailto:johannesobermayr&#64;gmx.de" title="Johannes Obermayr &lt;johannesobermayr&#64;gmx.de&gt;"> <span class="fn">Johannes Obermayr</span></a>
</span></b>
        <pre>The better command:
$ echo &quot;c&quot; | WINEDEBUG=-dbghelp_dwarf winedbg --gdb game.exe</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351806844.B4cfAe621.26001--

--===============2108103995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2108103995==--
