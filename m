From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56788] [nv96] Dota2 (wine) consistently crashes with
 "WARNING: out of code space, evicting all shaders"
Date: Sat, 10 Nov 2012 14:17:11 +0000
Message-ID: <bug-56788-8800-67Kd2ff9BO@http.bugs.freedesktop.org/>
References: <bug-56788-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0433323397=="
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


--===============0433323397==
Content-Type: multipart/alternative; boundary="1352557031.FF65e0.25948"; charset="us-ascii"


--1352557031.FF65e0.25948
Date: Sat, 10 Nov 2012 14:17:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56788

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 69862
  --> https://bugs.freedesktop.org/attachment.cgi?id=69862&action=edit
NV50_PROG_DEBUG_NO_COLORS=1 NV50_PROG_DEBUG=1
WINEPREFIX="~/.local/share/wineprefixes/steam" wine
C:\\\\windows\\\\command\\\\start.exe steam://rungameid/570 1>dota2.log  2>&1

The shaders, compressed in xz as the raw file is ~19MB

Note this is unedited output, thus it contains some wine messages
Most of which can be stripped with grep -v "fixme" logfile

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352557031.FF65e0.25948
Date: Sat, 10 Nov 2012 14:17:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56788#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv96] Dota2 (wine) consistently crashes with &quot;WARNING: out of code space, evicting all shaders&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56788">bug 56788</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=69862" name="attach_69862" title="NV50_PROG_DEBUG_NO_COLORS=1 NV50_PROG_DEBUG=1 WINEPREFIX=&quot;~/.local/share/wineprefixes/steam&quot; wine C:\\\\windows\\\\command\\\\start.exe steam://rungameid/570 1&gt;dota2.log  2&gt;&amp;1">attachment 69862</a> <a href="attachment.cgi?id=69862&amp;action=edit" title="NV50_PROG_DEBUG_NO_COLORS=1 NV50_PROG_DEBUG=1 WINEPREFIX=&quot;~/.local/share/wineprefixes/steam&quot; wine C:\\\\windows\\\\command\\\\start.exe steam://rungameid/570 1&gt;dota2.log  2&gt;&amp;1">[details]</a></span>
NV50_PROG_DEBUG_NO_COLORS=1 NV50_PROG_DEBUG=1
WINEPREFIX=&quot;~/.local/share/wineprefixes/steam&quot; wine
C:\\\\windows\\\\command\\\\start.exe steam://rungameid/570 1&gt;dota2.log  2&gt;&amp;1

The shaders, compressed in xz as the raw file is ~19MB

Note this is unedited output, thus it contains some wine messages
Most of which can be stripped with grep -v &quot;fixme&quot; logfile</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352557031.FF65e0.25948--

--===============0433323397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0433323397==--
