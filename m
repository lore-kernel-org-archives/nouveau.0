From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56788] [nv96] Dota2 (wine) consistently crashes with
 "WARNING: out of code space, evicting all shaders"
Date: Mon, 05 Nov 2012 23:19:22 +0000
Message-ID: <bug-56788-8800-9CpDsMxS46@http.bugs.freedesktop.org/>
References: <bug-56788-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838373623=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56788-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0838373623==
Content-Type: multipart/alternative; boundary="1352157562.72E5f30.27236"; charset="us-ascii"


--1352157562.72E5f30.27236
Date: Mon, 5 Nov 2012 23:19:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56788

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
To clear any confusion that I may have caused

Arch Linux 64bit -> wine 64bit -> wine 32bit -> Steam -> Dota2

Around the date mentioned I have updated the 64bit mesa not the multilib (which
is used), thus it is caused by the Dota updates

Since the issue has appeared I have updated to

{lib32-,}libgl-git 20121104.gite3542ea-1
{lib32-,}libglapi-git 20121104.gite3542ea-1
{lib32-,}mesa-git 20121104.gite3542ea-1
{lib32-,}nouveau-dri-git 20121104.gite3542ea-1

I cannot reproduce if -dxlevel81 is used (appended to command line)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352157562.72E5f30.27236
Date: Mon, 5 Nov 2012 23:19:22 +0000
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
   title="NEW --- - [nv96] Dota2 (wine) consistently crashes with &quot;WARNING: out of code space, evicting all shaders&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56788#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv96] Dota2 (wine) consistently crashes with &quot;WARNING: out of code space, evicting all shaders&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56788">bug 56788</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>To clear any confusion that I may have caused

Arch Linux 64bit -&gt; wine 64bit -&gt; wine 32bit -&gt; Steam -&gt; Dota2

Around the date mentioned I have updated the 64bit mesa not the multilib (which
is used), thus it is caused by the Dota updates

Since the issue has appeared I have updated to

{lib32-,}libgl-git 20121104.gite3542ea-1
{lib32-,}libglapi-git 20121104.gite3542ea-1
{lib32-,}mesa-git 20121104.gite3542ea-1
{lib32-,}nouveau-dri-git 20121104.gite3542ea-1

I cannot reproduce if -dxlevel81 is used (appended to command line)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352157562.72E5f30.27236--

--===============0838373623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0838373623==--
