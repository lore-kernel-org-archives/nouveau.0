From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70566] [NVD9] hard lock-ups entire system at random
	moments
Date: Thu, 17 Oct 2013 19:49:40 +0000
Message-ID: <bug-70566-8800-qWrbpCKD7l@http.bugs.freedesktop.org/>
References: <bug-70566-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1201352158=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70566-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1201352158==
Content-Type: multipart/alternative; boundary="1382039380.AbbCa2.11729"; charset="us-ascii"


--1382039380.AbbCa2.11729
Date: Thu, 17 Oct 2013 19:49:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70566

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|NVD0 card hard lock-ups     |[NVD9] hard lock-ups entire
                   |entire system at random     |system at random moments
                   |moments                     |

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Did this ever work properly, or has it always failed? (Or is this too new of a
setup?)

First order of business would be to try disabling MSI -- that will be off for
the final 3.12 release (although will be making a come-back for 3.13 in all
likelihood). Try booting with nouveau.config=NvMSI=0. [I assume you're using a
3.12-rc based on the messages you gave, but having a full dmesg is always
preferable.]

Would it be possible to set up a serial console or netconsole to see if there
are any further messages?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382039380.AbbCa2.11729
Date: Thu, 17 Oct 2013 19:49:40 +0000
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
   title="NEW --- - [NVD9] hard lock-ups entire system at random moments"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70566">bug 70566</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>NVD0 card hard lock-ups entire system at random moments
           </td>
           <td>[NVD9] hard lock-ups entire system at random moments
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] hard lock-ups entire system at random moments"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70566#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] hard lock-ups entire system at random moments"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70566">bug 70566</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Did this ever work properly, or has it always failed? (Or is this too new of a
setup?)

First order of business would be to try disabling MSI -- that will be off for
the final 3.12 release (although will be making a come-back for 3.13 in all
likelihood). Try booting with nouveau.config=NvMSI=0. [I assume you're using a
3.12-rc based on the messages you gave, but having a full dmesg is always
preferable.]

Would it be possible to set up a serial console or netconsole to see if there
are any further messages?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382039380.AbbCa2.11729--

--===============1201352158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1201352158==--
