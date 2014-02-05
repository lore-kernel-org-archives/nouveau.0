From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65116] [NV86/NVD9] gnome background misrendered
Date: Wed, 05 Feb 2014 07:52:16 +0000
Message-ID: <bug-65116-8800-CTgPYB083q@http.bugs.freedesktop.org/>
References: <bug-65116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0330519246=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0330519246==
Content-Type: multipart/alternative; boundary="1391586735.7CDBeFE01.30735"; charset="us-ascii"


--1391586735.7CDBeFE01.30735
Date: Wed, 5 Feb 2014 07:52:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65116

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Since upgrade to            |[NV86/NVD9] gnome
                   |libX11-1.5.99.902 several   |background misrendered
                   |problems with gnome desktop |

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It is most likely that the NV86 and NVD9 problems are unrelated. For the NV86
problem, can you try 3.14-rc1? We tracked down an issue where some G86M cards
had a disabled PCRYPT unit which wreaked havoc on all sorts of things; 3.14-rc1
will fall back on M2MF in that case.

For the NVD9 issue... also try 3.14-rc1, lots of stuff has been fixed. I can't
really tell from your description what you're seeing the issue to be, but
perhaps, whatever it is, has been fixed.

If the issues persist, please update the bug with *detailed* information as to
what you're seeing, attach logs, etc.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391586735.7CDBeFE01.30735
Date: Wed, 5 Feb 2014 07:52:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86/NVD9] gnome background misrendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65116">bug 65116</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Since upgrade to libX11-1.5.99.902 several problems with gnome desktop
           </td>
           <td>[NV86/NVD9] gnome background misrendered
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86/NVD9] gnome background misrendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65116#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86/NVD9] gnome background misrendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65116">bug 65116</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It is most likely that the NV86 and NVD9 problems are unrelated. For the NV86
problem, can you try 3.14-rc1? We tracked down an issue where some G86M cards
had a disabled PCRYPT unit which wreaked havoc on all sorts of things; 3.14-rc1
will fall back on M2MF in that case.

For the NVD9 issue... also try 3.14-rc1, lots of stuff has been fixed. I can't
really tell from your description what you're seeing the issue to be, but
perhaps, whatever it is, has been fixed.

If the issues persist, please update the bug with *detailed* information as to
what you're seeing, attach logs, etc.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391586735.7CDBeFE01.30735--

--===============0330519246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0330519246==--
