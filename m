From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Thu, 14 Apr 2011 15:40:22 -0700 (PDT)
Message-ID: <20110414224022.4B06913004F@annarchy.freedesktop.org>
References: <bug-34554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34554

--- Comment #16 from Andy Getz <suertreus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-04-14 15:40:19 PDT ---
Created an attachment (id=45638)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45638)
C program for reading, writing, and manipulating contents of EDID EEPROMs
attached to I2C/DDC interfaces using SMBus

/* Copyright (C) 2011 Andy Getzendanner                                      
//
// Hereby licensed AS-IS to anyone who wants it                              
//
// Responsibility and liability for unintended consequences including        
//
// hardware damage are hereby disclaimed; USE ONLY AT YOUR OWN RISK          
//
// Note: compile with at least -O due to inlined SMBus functions             
//
// Note: errors in i2c-dev.h likely result from using the kernel-internal    
//
//       version of that file rather than the userspace-facing one from the  
//
//       i2c-tools package, available from:                                  
//
//           http://www.lm-sensors.org/wiki/I2CTools                         
*/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
