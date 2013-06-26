From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66129] [BISECTED] nouveau,
 nv50: dual display doesn't work in 3.9
Date: Wed, 26 Jun 2013 20:55:21 +0000
Message-ID: <bug-66129-8800-XEi3KGjpOR@http.bugs.freedesktop.org/>
References: <bug-66129-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1369441212=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66129-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1369441212==
Content-Type: multipart/alternative; boundary="1372280121.BeB6d4.28808"; charset="us-ascii"


--1372280121.BeB6d4.28808
Date: Wed, 26 Jun 2013 20:55:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66129

--- Comment #6 from Per Arnold Blaasmo <per.arnold-E3z7vgVcB3VuMpJDpNschA@public.gmane.org> ---
I just started my summer vacation :-)'
So I am not able to test using each monitor as single head right now.
I will do that when I am back around 15.July.

I the mean time I have uploaded the dmesg from running with kernel 3.8.1 and
3.9.4. 

3.8.11 is the last kernel that give me good result.
I have tested with kernel 3.9.7, but have the same result as with other 3.9.x
kernels.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372280121.BeB6d4.28808
Date: Wed, 26 Jun 2013 20:55:21 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129">bug 66129</a>
              from <span class="vcard"><a class="email" href="mailto:per.arnold&#64;blaasmo.no" title="Per Arnold Blaasmo &lt;per.arnold&#64;blaasmo.no&gt;"> <span class="fn">Per Arnold Blaasmo</span></a>
</span></b>
        <pre>I just started my summer vacation :-)'
So I am not able to test using each monitor as single head right now.
I will do that when I am back around 15.July.

I the mean time I have uploaded the dmesg from running with kernel 3.8.1 and
3.9.4. 

3.8.11 is the last kernel that give me good result.
I have tested with kernel 3.9.7, but have the same result as with other 3.9.x
kernels.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372280121.BeB6d4.28808--

--===============1369441212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1369441212==--
