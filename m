From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83398] [NV4B] Screen freeze watching flash site
Date: Tue, 02 Sep 2014 17:17:48 +0000
Message-ID: <bug-83398-8800-zAxazJ3Poz@http.bugs.freedesktop.org/>
References: <bug-83398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0640348931=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0640348931==
Content-Type: multipart/alternative; boundary="1409678268.A0aD281.9694"; charset="us-ascii"


--1409678268.A0aD281.9694
Date: Tue, 2 Sep 2014 17:17:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83398

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> I already remove all files in /usr/lib/vdpau/ for bug 74320 (after each
> upgrade). Are there other files to remove?

Oh. Sorry, I wasn't paying close enough attention.

You're running out of vram, which the various software doesn't handle
particularly well.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409678268.A0aD281.9694
Date: Tue, 2 Sep 2014 17:17:48 +0000
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
   title="NEW --- - [NV4B] Screen freeze watching flash site"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83398#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] Screen freeze watching flash site"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83398">bug 83398</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=83398#c3">comment #3</a>)
<span class="quote">&gt; I already remove all files in /usr/lib/vdpau/ for <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] Screen freeze with flashplugin-nonfree"
   href="show_bug.cgi?id=74320">bug 74320</a> (after each
&gt; upgrade). Are there other files to remove?</span >

Oh. Sorry, I wasn't paying close enough attention.

You're running out of vram, which the various software doesn't handle
particularly well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409678268.A0aD281.9694--

--===============0640348931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0640348931==--
