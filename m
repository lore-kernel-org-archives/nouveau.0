From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 12:46:24 +0000
Message-ID: <bug-77361-8800-81sJEKpYOn@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0328354303=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0328354303==
Content-Type: multipart/alternative; boundary="1397393184.EAeFB1.23885"; charset="us-ascii"


--1397393184.EAeFB1.23885
Date: Sun, 13 Apr 2014 12:46:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |http://bugs.debian.org/7409
                   |                            |53

--- Comment #21 from Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> ---
The same problem has also been reported in the Debian BTS, one of the people
who saw it claimed that unsetting CONFIG_X86_SYSFB when building the kernel
helps: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=740953#40

Note that Debian enabled CONFIG_X86_SYSFB in 3.13, in their 3.12 kernel it is
not set.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397393184.EAeFB1.23885
Date: Sun, 13 Apr 2014 12:46:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:svenjoac&#64;gmx.de" title="Sven Joachim &lt;svenjoac&#64;gmx.de&gt;"> <span class="fn">Sven Joachim</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>http://bugs.debian.org/740953
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:svenjoac&#64;gmx.de" title="Sven Joachim &lt;svenjoac&#64;gmx.de&gt;"> <span class="fn">Sven Joachim</span></a>
</span></b>
        <pre>The same problem has also been reported in the Debian BTS, one of the people
who saw it claimed that unsetting CONFIG_X86_SYSFB when building the kernel
helps: <a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=740953#40">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=740953#40</a>

Note that Debian enabled CONFIG_X86_SYSFB in 3.13, in their 3.12 kernel it is
not set.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397393184.EAeFB1.23885--

--===============0328354303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0328354303==--
