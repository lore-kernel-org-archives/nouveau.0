From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62870] Steam.sh fails at line 704,
 possibly relating to mesa stack
Date: Thu, 20 Jun 2013 01:07:11 +0000
Message-ID: <bug-62870-8800-b9L5Jvnwcz@http.bugs.freedesktop.org/>
References: <bug-62870-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0926960005=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62870-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0926960005==
Content-Type: multipart/alternative; boundary="1371690430.B6700F0.17919"; charset="us-ascii"


--1371690430.B6700F0.17919
Date: Thu, 20 Jun 2013 01:07:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62870

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Can you get a backtrace of the crash

1. Install mesa,libgl,nouveau symbols
2. Set gdb as STEAM_DEBUGGER 
$ export STEAM_DEBUGGER=gdb
3. run steam

Additionally it would be appreciated if you can provide more information as to
what software you have on your system (ie. mesa, nouveau-dri and kernel
version) and some logs (dmesg & Xorg.log)

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1371690430.B6700F0.17919
Date: Thu, 20 Jun 2013 01:07:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Steam.sh fails at line 704, possibly relating to mesa stack"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62870">bug 62870</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Steam.sh fails at line 704, possibly relating to mesa stack"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62870#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Steam.sh fails at line 704, possibly relating to mesa stack"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62870">bug 62870</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Can you get a backtrace of the crash

1. Install mesa,libgl,nouveau symbols
2. Set gdb as STEAM_DEBUGGER 
$ export STEAM_DEBUGGER=gdb
3. run steam

Additionally it would be appreciated if you can provide more information as to
what software you have on your system (ie. mesa, nouveau-dri and kernel
version) and some logs (dmesg &amp; Xorg.log)

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371690430.B6700F0.17919--

--===============0926960005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0926960005==--
