From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69827] New: Uneven, jerky mouse movement,
	increasing CPU usage
Date: Thu, 26 Sep 2013 01:56:25 +0000
Message-ID: <bug-69827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0063827032=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0063827032==
Content-Type: multipart/alternative; boundary="1380160586.Bc20d11.25134"; charset="us-ascii"


--1380160586.Bc20d11.25134
Date: Thu, 26 Sep 2013 01:56:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69827

          Priority: medium
            Bug ID: 69827
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Uneven, jerky mouse movement, increasing CPU usage
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jimoe-zgPZrQL6nFyVmwMjj6irZQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 86603
  --> https://bugs.freedesktop.org/attachment.cgi?id=86603&action=edit
kernel log when CPU usage has increased significantly without apparent cause

openSUSE v12.3
  linux v3.7.10-1.1-desktop x86_64
  gnome 3.6.2
  nouveau video driver
  nVidia gt470 graphics adapter
  AMD Athlon II X4 630 Processor

I filed this bug in the Gnome Bugzilla system
<https://bugzilla.gnome.org/show_bug.cgi?id=699285>. After a long delay, they
suggested filing it here. So here it is.

I have attached a kernel log from today.

Commentary from the Gnome report:

Ever since gnome version 3.2 the mouse movement becomes more uneven as the
logon time increases. Initially the movement is smooth and even as expected. As
the session time increases the movement shows regular pauses (every 1 - 2
seconds) for some fraction of a second, then "catches up" to where it would
have been had it not paused. As the session time increases, so does the
jerkiness, i.e., the pauses increase in length.

This is annoying. It is exaggerated in a VirtualBox VM, guest type os/2, where
tje issue is quite pronounced. Given enough time, though, even native apps show
the jerkiness.

It is related somehow to the build up of CPU usage. Initially the idle time
usage is about 4% with a browser, email agent and a VM. As time goes by the
idle usage increases to about 15% where the mouse action is so uneven that it
is no longer tolerable.

The problem has worsened with later versions since 3.2; the jerkiness increases
after only several hours rather than days. It has gotten so bad that I have
gone to KDE where there is no such issue.

It occurs for two different mice, a wired unit and a wireless one. I
am currently using a Logitech MX300 mouse. Dis-/re-connecting the mice made no
difference.

The only solution so far is to log out and in again, or more recently, use KDE.

Other systems here do not have this problem. The primary difference is that
this system has a nVidia graphics adapter; all the other systems have ATI
adapters of some sort.


See the "top" results below. Note that gnome-shell starts at about 7% CPU
usage, 11 hours later it has risen to 18%. I really prefer Gnome over KDE. It
is sad that this issue has made it unusable.

Here a section of "top" when Gnome first starts after login.

top - 11:55:44 up 11 days, 13:27,  3 users,  load average: 4.14, 4.24, 4.30
Tasks: 240 total,   1 running, 238 sleeping,   0 stopped,   1 zombie
%Cpu(s):  2.4 us,  2.6 sy,  0.0 ni, 95.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   8192128 total,  7930368 used,   261760 free,   158984 buffers
KiB Swap:  2104476 total,    80392 used,  2024084 free,  5654784 cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM     TIME+ COMMAND            
14487 jmoe      20   0 2916m 1.0g 982m S  8.0 12.8   5:47.24 VirtualBox         
14430 jmoe      20   0 1937m 178m  49m S  7.0  2.2   6:00.63 gnome-shell        
14125 root      20   0  342m  93m  25m S  2.3  1.2   3:20.56 Xorg               
15310 jmoe      20   0 1878m 248m  45m S  1.7  3.1   6:13.28 thunderbird-bin    
16267 jmoe      20   0  340m  17m  12m S  0.7  0.2   0:28.97 gkrellm            
14445 jmoe      20   0 1099m  30m  19m S  0.3  0.4   0:06.15 nautilus           
18756 root      20   0     0    0    0 S  0.3  0.0   0:01.58 kworker/2:2        
19684 root      20   0     0    0    0 S  0.3  0.0   0:01.08 kworker/1:2        
21537 jmoe      20   0 19392 1736 1124 R  0.3  0.0   0:00.25 top                
    1 root      20   0 48376 6428 1588 S  0.0  0.1   0:04.41 systemd            


Here a section of "top" after Gnome has run for 11 hours.

top - 23:02:54 up 12 days, 33 min,  6 users,  load average: 2.51, 2.56, 2.26
Tasks: 238 total,   1 running, 236 sleeping,   0 stopped,   1 zombie
%Cpu(s):  3.6 us,  9.1 sy,  0.0 ni, 87.0 id,  0.1 wa,  0.0 hi,  0.2 si,  0.0 st
KiB Mem:   8192128 total,  7861724 used,   330404 free,   222484 buffers
KiB Swap:  2104476 total,    84064 used,  2020412 free,  5327096 cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM     TIME+ COMMAND            
14430 jmoe      20   0 1973m 209m  45m S 18.2  2.6  80:11.73 gnome-shell        
22624 jmoe      20   0 2926m 1.0g 1.0g S  8.9 13.1  35:06.52 VirtualBox         
14125 root      20   0  366m 118m  26m S  3.0  1.5  30:18.57 Xorg               
16393 jmoe      20   0 1245m 248m  51m S  1.7  3.1   9:07.27 firefox            
24200 jmoe      20   0 1879m 307m  47m S  1.7  3.8  12:00.58 thunderbird-bin    
14959 jmoe      20   0  705m  24m  14m S  1.0  0.3   1:15.76 gnome-terminal     
16267 jmoe      20   0  340m  17m  12m S  0.7  0.2   6:16.21 gkrellm            
23162 jmoe      20   0 19392 1732 1124 R  0.7  0.0   0:00.03 top

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380160586.Bc20d11.25134
Date: Thu, 26 Sep 2013 01:56:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827">69827</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Uneven, jerky mouse movement, increasing CPU usage
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jimoe&#64;sohnen-moe.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2011)
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=86603" name="attach_86603" title="kernel log when CPU usage has increased significantly without apparent cause">attachment 86603</a> <a href="attachment.cgi?id=86603&amp;action=edit" title="kernel log when CPU usage has increased significantly without apparent cause">[details]</a></span>
kernel log when CPU usage has increased significantly without apparent cause

openSUSE v12.3
  linux v3.7.10-1.1-desktop x86_64
  gnome 3.6.2
  nouveau video driver
  nVidia gt470 graphics adapter
  AMD Athlon II X4 630 Processor

I filed this bug in the Gnome Bugzilla system
&lt;<a href="https://bugzilla.gnome.org/show_bug.cgi?id=699285">https://bugzilla.gnome.org/show_bug.cgi?id=699285</a>&gt;. After a long delay, they
suggested filing it here. So here it is.

I have attached a kernel log from today.

Commentary from the Gnome report:

Ever since gnome version 3.2 the mouse movement becomes more uneven as the
logon time increases. Initially the movement is smooth and even as expected. As
the session time increases the movement shows regular pauses (every 1 - 2
seconds) for some fraction of a second, then &quot;catches up&quot; to where it would
have been had it not paused. As the session time increases, so does the
jerkiness, i.e., the pauses increase in length.

This is annoying. It is exaggerated in a VirtualBox VM, guest type os/2, where
tje issue is quite pronounced. Given enough time, though, even native apps show
the jerkiness.

It is related somehow to the build up of CPU usage. Initially the idle time
usage is about 4% with a browser, email agent and a VM. As time goes by the
idle usage increases to about 15% where the mouse action is so uneven that it
is no longer tolerable.

The problem has worsened with later versions since 3.2; the jerkiness increases
after only several hours rather than days. It has gotten so bad that I have
gone to KDE where there is no such issue.

It occurs for two different mice, a wired unit and a wireless one. I
am currently using a Logitech MX300 mouse. Dis-/re-connecting the mice made no
difference.

The only solution so far is to log out and in again, or more recently, use KDE.

Other systems here do not have this problem. The primary difference is that
this system has a nVidia graphics adapter; all the other systems have ATI
adapters of some sort.


See the &quot;top&quot; results below. Note that gnome-shell starts at about 7% CPU
usage, 11 hours later it has risen to 18%. I really prefer Gnome over KDE. It
is sad that this issue has made it unusable.

Here a section of &quot;top&quot; when Gnome first starts after login.

top - 11:55:44 up 11 days, 13:27,  3 users,  load average: 4.14, 4.24, 4.30
Tasks: 240 total,   1 running, 238 sleeping,   0 stopped,   1 zombie
%Cpu(s):  2.4 us,  2.6 sy,  0.0 ni, 95.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   8192128 total,  7930368 used,   261760 free,   158984 buffers
KiB Swap:  2104476 total,    80392 used,  2024084 free,  5654784 cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM     TIME+ COMMAND            
14487 jmoe      20   0 2916m 1.0g 982m S  8.0 12.8   5:47.24 VirtualBox         
14430 jmoe      20   0 1937m 178m  49m S  7.0  2.2   6:00.63 gnome-shell        
14125 root      20   0  342m  93m  25m S  2.3  1.2   3:20.56 Xorg               
15310 jmoe      20   0 1878m 248m  45m S  1.7  3.1   6:13.28 thunderbird-bin    
16267 jmoe      20   0  340m  17m  12m S  0.7  0.2   0:28.97 gkrellm            
14445 jmoe      20   0 1099m  30m  19m S  0.3  0.4   0:06.15 nautilus           
18756 root      20   0     0    0    0 S  0.3  0.0   0:01.58 kworker/2:2        
19684 root      20   0     0    0    0 S  0.3  0.0   0:01.08 kworker/1:2        
21537 jmoe      20   0 19392 1736 1124 R  0.3  0.0   0:00.25 top                
    1 root      20   0 48376 6428 1588 S  0.0  0.1   0:04.41 systemd            


Here a section of &quot;top&quot; after Gnome has run for 11 hours.

top - 23:02:54 up 12 days, 33 min,  6 users,  load average: 2.51, 2.56, 2.26
Tasks: 238 total,   1 running, 236 sleeping,   0 stopped,   1 zombie
%Cpu(s):  3.6 us,  9.1 sy,  0.0 ni, 87.0 id,  0.1 wa,  0.0 hi,  0.2 si,  0.0 st
KiB Mem:   8192128 total,  7861724 used,   330404 free,   222484 buffers
KiB Swap:  2104476 total,    84064 used,  2020412 free,  5327096 cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM     TIME+ COMMAND            
14430 jmoe      20   0 1973m 209m  45m S 18.2  2.6  80:11.73 gnome-shell        
22624 jmoe      20   0 2926m 1.0g 1.0g S  8.9 13.1  35:06.52 VirtualBox         
14125 root      20   0  366m 118m  26m S  3.0  1.5  30:18.57 Xorg               
16393 jmoe      20   0 1245m 248m  51m S  1.7  3.1   9:07.27 firefox            
24200 jmoe      20   0 1879m 307m  47m S  1.7  3.8  12:00.58 thunderbird-bin    
14959 jmoe      20   0  705m  24m  14m S  1.0  0.3   1:15.76 gnome-terminal     
16267 jmoe      20   0  340m  17m  12m S  0.7  0.2   6:16.21 gkrellm            
23162 jmoe      20   0 19392 1732 1124 R  0.7  0.0   0:00.03 top</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380160586.Bc20d11.25134--

--===============0063827032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0063827032==--
