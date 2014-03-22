From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] [NV4C] Nouveau dmesg error, computer hangs
Date: Sat, 22 Mar 2014 13:45:10 +0000
Message-ID: <bug-71382-8800-k1bm1qllVC@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1519422343=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1519422343==
Content-Type: multipart/alternative; boundary="1395495910.bc58b62.19553"; charset="us-ascii"


--1395495910.bc58b62.19553
Date: Sat, 22 Mar 2014 13:45:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #8 from Camilo Gonzalez <cagonto1980-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have got the same problem with my NV4C chipset.

I have been looking for the same bug in Fedora bugzilla, but have not found.

I am using 32-bits KDE Fedora 19 with latest version of nouveau.

There are 2 main ways to reproduce the hang, although it happens randomly:

1.- Trying Firefox startup.
2.- Launching KInfoCenter and clicking on Graphical Information -> OpenGL.

Attempting these 2 actions repeteadly should cause the hang.

There is an other trail: the hang began to happen when I enabled hardware
acceleration (kernel parameter nouveau.noaccel=0).

I provoked the hang while ran the command 'dmesg -T -w -x > ./CGTdmesg.log' on
a Konsole terminal.
I have attached the file CGTdmesg.log for more information.
However, there is no significant logs in it.
Everybody can see that a message was being written when the hang started.

I hope this information to be useful.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395495910.bc58b62.19553
Date: Sat, 22 Mar 2014 13:45:10 +0000
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
   title="NEW --- - [NV4C] Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4C] Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:cagonto1980&#64;gmail.com" title="Camilo Gonzalez &lt;cagonto1980&#64;gmail.com&gt;"> <span class="fn">Camilo Gonzalez</span></a>
</span></b>
        <pre>I have got the same problem with my NV4C chipset.

I have been looking for the same bug in Fedora bugzilla, but have not found.

I am using 32-bits KDE Fedora 19 with latest version of nouveau.

There are 2 main ways to reproduce the hang, although it happens randomly:

1.- Trying Firefox startup.
2.- Launching KInfoCenter and clicking on Graphical Information -&gt; OpenGL.

Attempting these 2 actions repeteadly should cause the hang.

There is an other trail: the hang began to happen when I enabled hardware
acceleration (kernel parameter nouveau.noaccel=0).

I provoked the hang while ran the command 'dmesg -T -w -x &gt; ./CGTdmesg.log' on
a Konsole terminal.
I have attached the file CGTdmesg.log for more information.
However, there is no significant logs in it.
Everybody can see that a message was being written when the hang started.

I hope this information to be useful.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395495910.bc58b62.19553--

--===============1519422343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1519422343==--
