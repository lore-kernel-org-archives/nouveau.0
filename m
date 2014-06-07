From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] MSI doesn't work
Date: Sat, 07 Jun 2014 17:26:21 +0000
Message-ID: <bug-78441-8800-AEXRgk7JtY@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1751018689=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1751018689==
Content-Type: multipart/alternative; boundary="1402161980.fC03F61.4243"; charset="us-ascii"


--1402161980.fC03F61.4243
Date: Sat, 7 Jun 2014 17:26:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NV46] X does not start     |[NV46] MSI doesn't work
                   |under kernel 3.13.x         |

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
http://en.wikipedia.org/wiki/Message_Signaled_Interrupts

It's a non-critical feature. Support for using MSI on nvidia cards was added in
kernel 3.13, which was why I had suggested trying to disable it.

I guess the rearm register must be somewhere else, or something extra needs to
be done...

OTOH, it's very interesting that you bisected it to that particular commit.
It's not the commit that turns on MSI, but rather a commit that fixes MSI for
some situations, making it more reliable. But apparently not for you...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402161980.fC03F61.4243
Date: Sat, 7 Jun 2014 17:26:20 +0000
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
   title="NEW --- - [NV46] MSI doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NV46] X does not start under kernel 3.13.x
           </td>
           <td>[NV46] MSI doesn't work
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] MSI doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] MSI doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre><a href="http://en.wikipedia.org/wiki/Message_Signaled_Interrupts">http://en.wikipedia.org/wiki/Message_Signaled_Interrupts</a>

It's a non-critical feature. Support for using MSI on nvidia cards was added in
kernel 3.13, which was why I had suggested trying to disable it.

I guess the rearm register must be somewhere else, or something extra needs to
be done...

OTOH, it's very interesting that you bisected it to that particular commit.
It's not the commit that turns on MSI, but rather a commit that fixes MSI for
some situations, making it more reliable. But apparently not for you...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402161980.fC03F61.4243--

--===============1751018689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1751018689==--
